import 'package:bloc/bloc.dart';
import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/config/extensions/extensions.dart';
import 'package:flower_app/config/helpers/app_regex.dart';
import 'package:flower_app/src/data/api/core/error/error_handler.dart';
import 'package:flower_app/src/domain/entities/auth_request/reset_password_request.dart';
import 'package:flower_app/src/domain/entities/auth_response/reset_password_response.dart';
import 'package:flower_app/src/domain/use_cases/auth_use_cases/reset_password_use_case.dart';
import 'package:flower_app/src/presentation/managers/reset_password/reset_password_view_action.dart';
import 'package:flower_app/src/presentation/managers/reset_password/reset_password_view_state.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordViewModel extends Cubit<ResetPasswordViewState> {
  final ResetPasswordUseCase _resetPasswordUseCase;
  GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  bool isObscureText = true;
  String? email = '';
  bool valid = false;
  ResetPasswordViewModel(this._resetPasswordUseCase)
      : super(InitialResetPasswordView());

  void doAction(ResetPasswordViewAction action) {
    switch (action) {
      case ChangePasswordVisibilityAction():
        {
          _changePasswordVisibility();
          break;
        }
      case OnCompleteResetPassword():
        {
          _resetPassword();
          break;
        }
      case FormDataChangedAction():
      {
        _updateValidationState();
        break;
      }
    }
  }

  void _resetPassword() async {
    if (resetPasswordFormKey.currentState!.validate()) {
      emit(ResetPasswordLoadingState());
      var response = await _resetPasswordUseCase.callResetPasswordUseCase(
          ResetPasswordRequest(
              email: email, newPassword: passwordController.text));
      switch (response) {
        case Success<ResetPasswordResponse>():
          emit(PopDialogState());
          emit(ResetPasswordSuccessState());
          break;
        case Failures<ResetPasswordResponse>():
          emit(PopDialogState());
          final error = ErrorHandler.fromException(response.exception);
          emit(ResetPasswordFailedState(error.errorMassage));
          break;
      }
    }
  }

  String? validatePassword() {
    String? password = passwordController.text;
    if (password.length < 8) {
      return "Password must be more than 8";
    }
    if (password.isNullOrEmpty() ||
        !AppRegex.passwordValidationRegex.hasMatch(password)) {
      return "invalid Password";
    }

    return null;
  }

  void _changePasswordVisibility() {
    isObscureText = !isObscureText;
    isObscureText
        ? emit(NonVisiblePasswordState())
        : emit(VisiblePasswordState());
  }

  void _updateValidationState() {
    if (passwordController.text.isEmpty) {
      valid = false;
    } else if (!resetPasswordFormKey.currentState!.validate()) {
      valid = false;
    } else {
      valid = true;
    }
    emit(UpdateValidationState());
  }
}
