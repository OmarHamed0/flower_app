import 'dart:io';

import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/domain/entities/auth/user_entity.dart';
import 'package:flower_app/src/presentation/managers/profile/profile_viewmodel/profile_actions.dart';
import 'package:flower_app/src/presentation/managers/profile/profile_viewmodel/profile_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../data/api/core/error/error_handler.dart';
import '../../../../domain/use_cases/profile_usecase/profile_usecase.dart';

@injectable
class ProfileScreenViewModel extends Cubit<ProfileScreenState> {
  final ProfileUseCase _profileUseCase;

  ProfileScreenViewModel(this._profileUseCase)
      : super(const ProfileScreenLoading());

  var currentImageUrl;
  UserEntity? currentUser;
  File? image;
  set setImage(File? value) {
    image = value;
  }

  void doAction(ProfileAction action) {
    switch (action) {
      case GetUserDataProfileAction():
        _getUserData();
      case LogOutProfileAction():
        _logOut();
    }
  }

  void _getUserData() async {
    emit(ProfileScreenLoading());

    var result = await _profileUseCase.getUserData();

    if (result is Success<UserEntity>) {
      currentUser = result.data;
      final user = result.data;
      if (user?.firstName == 'Guest') {
        emit(ProfileGuestScreenLoadedState(user: user));
        return;
      }
      emit(ProfileScreenLoaded(user: user));
    } else if (result is Failures<UserEntity>) {
      final error = ErrorHandler.fromException(result.exception);
      emit(ProfileScreenError(error.errorMassage));
    }
  }

  void _logOut() async {
    var result = await _profileUseCase.logOut();
    switch (result) {
      case Success<void>():
        emit(const ProfileScreenLogout());
        break;
      case Failures<void>():
        print(result.exception);
        final error = ErrorHandler.fromException(result.exception);
        emit(ProfileScreenError(error.errorMassage));
        break;
    }
  }
}
