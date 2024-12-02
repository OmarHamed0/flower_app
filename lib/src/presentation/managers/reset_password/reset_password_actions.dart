sealed class ResetPasswordActions{}
class UpdatePasswordAction extends ResetPasswordActions {}
class ActiveUpdateButtonAction extends ResetPasswordActions {}
class LogoutAction extends  ResetPasswordActions{}
class ChangePasswordVisibilityAction extends ResetPasswordActions{
  int fieldId;
  ChangePasswordVisibilityAction({required this.fieldId});
}