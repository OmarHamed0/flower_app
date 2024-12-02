import 'package:bloc/bloc.dart';
import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/common/common.dart';
import 'package:flower_app/config/extensions/extensions.dart';
import 'package:flower_app/config/helpers/app_regex.dart';
import 'package:flower_app/src/data/api/core/error/error_handler.dart';
import 'package:flower_app/src/domain/entities/auth/reset_password_entity.dart';
import 'package:flower_app/src/domain/use_cases/reset_password_use_case.dart';
import 'package:flower_app/src/presentation/managers/reset_password/reset_password_actions.dart';
import 'package:flower_app/src/presentation/managers/reset_password/reset_password_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordViewModel extends Cubit<ResetPasswordStates> {
  final ResetPasswordUseCase _resetPasswordUseCase;

  ResetPasswordViewModel(this._resetPasswordUseCase) : super(InitialState());
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  void _activeUpdateButton(){
    if (formKey.currentState!.validate()) {
      if (newPasswordController.text.length != confirmPasswordController.text.length) {
        emit(DeActiveButtonState());
      }
      else if(newPasswordController.text.length == confirmPasswordController.text.length && newPasswordController.text != confirmPasswordController.text ){
        emit(DeActiveButtonState());
      }
     else {
        emit(ActiveButtonState());
      }
     return;
    }
    emit(DeActiveButtonState());
  }

  bool _validateInput() {
    return formKey.currentState!.validate();
  }


  String? validatePassword(String password){
    if(password.length < 8){
      return "Password must be more than 8";
    }
    if(password.isNullOrEmpty() || !AppRegex.passwordValidationRegex.hasMatch(password)){
      return "invalid Password";
    }
    return null;
  }


  String? validateConfirmPassword(String password){
    if(password.length < 8){
      return "Password must be more than 8";
    }
    if(password.isNullOrEmpty() || !AppRegex.passwordValidationRegex.hasMatch(password)){
      return "invalid Password";
    }
     if(newPasswordController.text.length == confirmPasswordController.text.length && newPasswordController.text != confirmPasswordController.text ){
       return "Password does not match";
    }
    return null;
  }


  void _updatePassword() async {
    if(_validateInput() == false) return;
    emit(LoadingState());
    var response = await _resetPasswordUseCase.resetPassword(
        currentPasswordController.text, newPasswordController.text);
    switch (response) {
      case Success<ResetPasswordEntity>():
        emit(SuccessState());
        break;
      case Failures<ResetPasswordEntity>():
        emit(ErrorState(message: _getErrorMessage(response)));
    }
  }

  String _getErrorMessage(Failures<ResetPasswordEntity> response) {
    var errorMessage =
        ErrorHandler.fromException(response.exception).errorMassage;
    return errorMessage;
  }

  void doActin(ResetPasswordActions action) {
    switch (action) {
      case UpdatePasswordAction():
        _updatePassword();
        break;

      case ActiveUpdateButtonAction():
        _activeUpdateButton();
        break;
    }
  }
}
