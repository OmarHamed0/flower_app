sealed class ForgetPasswordViewState {}

class InitialForgetPasswordViewState extends ForgetPasswordViewState {}

class ForgetPasswordLoadingState extends ForgetPasswordViewState {}

class ForgetPasswordSuccessState extends ForgetPasswordViewState {}

class ForgetPasswordFailState extends ForgetPasswordViewState {
  String message;

  ForgetPasswordFailState(this.message);
}

class UpdateValidationState extends ForgetPasswordViewState {}

class FormErrorState extends ForgetPasswordViewState {}

class PopDialogState extends ForgetPasswordViewState {}


sealed class ForgetPasswordViewAction {}

class FormDataChangedAction extends ForgetPasswordViewAction {}

class ForgetPasswordAction extends ForgetPasswordViewAction {}
