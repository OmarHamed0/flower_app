import 'package:flower_app/src/domain/entities/auth/user_entity.dart';

sealed class EditProfileState {
  const EditProfileState();
}

class EditProfileInitial extends EditProfileState {
  const EditProfileInitial();
}

class EditProfileLoading extends EditProfileState {
  const EditProfileLoading();
}

class EditProfileLoaded extends EditProfileState {
  final UserEntity? user;
  const EditProfileLoaded({
    required this.user,
  });
}

class EditProfileError extends EditProfileState {
  final String message;
  const EditProfileError(
    this.message,
  );
}

class EditProfileSuccessState extends EditProfileState {
  const EditProfileSuccessState();
}

class EditProfileLoadingState extends EditProfileState {
  const EditProfileLoadingState();
}

class PopLoadingDialogState extends EditProfileState {}

class ValidateColorButtonState extends EditProfileState {
  final bool validate;
  const ValidateColorButtonState({
    required this.validate,
  });
}
