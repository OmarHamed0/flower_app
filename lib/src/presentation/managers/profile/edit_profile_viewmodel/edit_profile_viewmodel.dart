import 'package:flower_app/src/domain/entities/auth/user_entity.dart';
import 'package:flower_app/src/presentation/managers/profile/edit_profile_viewmodel/edit_profile_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../common/api_result.dart';
import '../../../../data/api/core/error/error_handler.dart';
import '../../../../domain/entities/auth/edit_profile_model.dart';
import '../../../../domain/use_cases/profile_usecase/profile_usecase.dart';
import 'edit_profile_actions.dart';

@injectable
class EditProfileViewModel extends Cubit<EditProfileState> {
  final ProfileUseCase _profileUseCase;

  EditProfileViewModel(this._profileUseCase)
      : super(const EditProfileLoading());

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  UserEntity? currentUser;
  void doAction(EditProfileAction action) {
    switch (action) {
      case EditProfileButtonAction():
        _editProfile();
        break;
      case GetUserDataAction():
        _getUserData();
    }
  }

  void _getUserData() async {
    var result = await _profileUseCase.getUserData();

    if (result is Success<UserEntity>) {
      final user = result.data;
      firstNameController.value = TextEditingValue(text: user?.firstName ?? '');
      lastNameController.value = TextEditingValue(text: user?.lastName ?? '');
      emailController.value = TextEditingValue(text: user?.email ?? '');
      phoneController.value = TextEditingValue(text: user?.phone ?? '');
      currentUser = user;
      emit(EditProfileLoaded(user: user));
    } else if (result is Failures<UserEntity>) {
      emit(EditProfileError(result.exception));
    }
  }

  @override
  Future<void> close() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    return super.close();
  }

  void _editProfile() async {
    if (isClosed) return;
    // emit(const EditProfileLoadingState());
    final user = EditProfileModel(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      phone: phoneController.text,
    );
    var result = await _profileUseCase.editProfile(user);
    if (isClosed) return; // Double-check after async operation
    if (result is Success<UserEntity>) {
      emit(const EditProfileSuccessState());
    } else if (result is Failures<UserEntity>) {
      emit(EditProfileError(result.exception));
    }
  }
}
