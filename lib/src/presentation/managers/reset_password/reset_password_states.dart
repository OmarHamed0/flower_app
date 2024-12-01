class ResetPasswordStates{}
class InitialState extends ResetPasswordStates{}
class LoadingState extends ResetPasswordStates{}
class SuccessState extends ResetPasswordStates{}
class ErrorState extends ResetPasswordStates{
  String? message;
  ErrorState({this.message});
}