import 'package:flower_app/src/domain/entities/auth/user_entity.dart';
import 'package:flower_app/src/presentation/managers/profile/edit_profile_viewmodel/edit_profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../common/api_result.dart';
import '../../../../data/api/core/error/error_handler.dart';
import '../../../../domain/use_cases/profile_usecase/profile_usecase.dart';

@injectable
class EditProfileViewModel extends Cubit<EditProfileState> {
  final ProfileUseCase _profileUseCase;

  EditProfileViewModel(this._profileUseCase)
      : super(const EditProfileLoading());

  void getUserData() async {
    var result = await _profileUseCase.getUserData();

    if (result is Success<UserEntity>) {
      final user = result.data;

      emit(EditProfileLoaded(user: user));
    } else if (result is Failures<UserEntity>) {
      final error = ErrorHandler.fromException(result.exception);
      emit(EditProfileError(error.errorMassage));
    }
  }
}
