class ResetPasswordStates{}
class InitialState extends ResetPasswordStates{}
class LoadingState extends ResetPasswordStates{}
class SuccessState extends ResetPasswordStates{}
class ErrorState extends ResetPasswordStates{
  String? message;
  ErrorState({this.message});
}
class PopLoadingDialogState extends ResetPasswordStates{}
class ActiveButtonState extends ResetPasswordStates{}
class DeActiveButtonState extends ResetPasswordStates{}
class ChangePasswordVisibilityState extends ResetPasswordStates {
}