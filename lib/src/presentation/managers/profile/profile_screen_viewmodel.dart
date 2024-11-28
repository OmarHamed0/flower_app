import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/domain/entities/auth/user_entity.dart';
import 'package:flower_app/src/presentation/managers/profile/profile_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../data/api/core/error/error_handler.dart';
import '../../../domain/use_cases/profile_usecase/profile_usecase.dart';

@injectable
class ProfileScreenViewModel extends Cubit<ProfileScreenState> {
  final ProfileUseCase _profileUseCase;

  ProfileScreenViewModel(this._profileUseCase)
      : super(const ProfileScreenLoading());

  void getUserData() async {
    emit(ProfileScreenLoading()); // emit loading state
    var result = await _profileUseCase.getUserData();
    switch (result) {
      case Success<UserEntity>():
        final user = result.data;
        emit(ProfileScreenLoaded(user: user));
        break;
      case Failures<UserEntity>():
        print(result.exception);
        final error = ErrorHandler.fromException(result.exception);
        emit(ProfileScreenError(error.errorMassage));
        break;
    }
  }
}
