sealed class ResetPasswordViewAction{}

class ChangePasswordVisibilityAction extends ResetPasswordViewAction{}

class OnCompleteResetPassword extends ResetPasswordViewAction{
  String email;
  OnCompleteResetPassword(this.email);
}

class FormDataChangedAction extends ResetPasswordViewAction {}