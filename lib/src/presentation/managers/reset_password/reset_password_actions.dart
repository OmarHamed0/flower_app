import 'package:flower_app/src/presentation/managers/reset_password/reset_password_view_model.dart';

sealed class ResetPasswordActions{}
class UpdatePasswordAction extends ResetPasswordActions {}
class ActiveUpdateButtonAction extends ResetPasswordActions {}
class LogoutAction extends  ResetPasswordActions{}
class ChangePasswordVisibilityAction extends ResetPasswordActions{
  PasswordFieldId fieldId;
  ChangePasswordVisibilityAction({required this.fieldId});
}