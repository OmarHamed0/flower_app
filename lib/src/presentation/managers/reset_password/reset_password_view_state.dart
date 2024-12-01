sealed class ResetPasswordViewState {}

class InitialResetPasswordView extends ResetPasswordViewState {}

class NonVisiblePasswordState extends ResetPasswordViewState {}

class VisiblePasswordState extends ResetPasswordViewState {}

class FormErrorState extends ResetPasswordViewState {}

class FromValidateState extends ResetPasswordViewState {}

class ResetPasswordLoadingState extends ResetPasswordViewState {}

class ResetPasswordSuccessState extends ResetPasswordViewState {}

class ResetPasswordFailedState extends ResetPasswordViewState {
  String? message;

  ResetPasswordFailedState(this.message);
}

class PopDialogState extends ResetPasswordViewState {}


class UpdateValidationState extends ResetPasswordViewState{}