class SignInStates{}

class SignInInitialState extends SignInStates {}

class SignInLoadingState extends SignInStates {}

class SignInSuccessState extends SignInStates {}

class SignInFailedState extends SignInStates {
  String? message;

  SignInFailedState(this.message);
}

class PopDialogState extends SignInStates {}

class VisiblePasswordState extends SignInStates {}

class NonVisiblePasswordState extends SignInStates {}

class CheckBoxState extends SignInStates {}

class NonCheckBoxState extends SignInStates {}

class FormErrorState extends SignInStates {}

class FromValidateState extends SignInStates {}


class GuestLoginState extends SignInStates{ }