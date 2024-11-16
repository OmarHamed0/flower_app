class SignInStates{}

class SignInInitialState extends SignInStates{}
class SignInLoadingState extends SignInStates{}
class SignInSuccessState extends SignInStates{}
class SingInFailedState extends SignInStates{
  String? message;
  SingInFailedState(this.message);
}
class VisiblePasswordState extends SignInStates{}
class NonVisiblePasswordState extends SignInStates{}
class CheckBoxState extends SignInStates{}
class NonCheckBoxState extends SignInStates{}
class FormErrorState extends SignInStates{}