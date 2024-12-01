sealed class OtpVerifyViewState {}

class InitialOtpVerifyViewState extends OtpVerifyViewState {}

class OnCompleteCodeVerifyState extends OtpVerifyViewState {}

class OtpVerifyLoadingState extends OtpVerifyViewState {}

class HideLoadingState extends OtpVerifyViewState {}

class NavigateToResetPasswordScreenState extends OtpVerifyViewState {}

class OtpSuccessState extends OtpVerifyViewState {}

class OtpFailState extends OtpVerifyViewState {
  String message;

  OtpFailState(this.message);
}

class OtpResendLoadingState extends OtpVerifyViewState {}

class OtpResendLoadingSuccessState extends OtpVerifyViewState {}

class OtpResendLoadingFailState extends OtpVerifyViewState {
  String message;

  OtpResendLoadingFailState(this.message);
}

class OtpNextFocusState extends OtpVerifyViewState {}

class OtpPreviousFocusState extends OtpVerifyViewState {}

class UpdateValidationState extends OtpVerifyViewState {}

class PopDialogState extends OtpVerifyViewState {}

class OtpFormErrorState extends OtpVerifyViewState {}
