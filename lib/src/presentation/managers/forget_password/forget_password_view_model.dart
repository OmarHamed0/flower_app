import 'package:bloc/bloc.dart';
import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/config/extensions/extensions.dart';
import 'package:flower_app/config/helpers/app_regex.dart';
import 'package:flower_app/src/data/api/core/error/error_handler.dart';
import 'package:flower_app/src/domain/entities/auth_request/forget_password_request.dart';
import 'package:flower_app/src/domain/entities/auth_response/forget_password_response.dart';
import 'package:flower_app/src/domain/use_cases/auth_use_cases/forget_password_use_case.dart';
import 'package:flower_app/src/presentation/managers/forget_password/forget_password_contract.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPasswordViewState> {
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  ForgetPasswordViewModel(this._forgetPasswordUseCase)
      : super(InitialForgetPasswordViewState());

  final TextEditingController emailController = TextEditingController();
  bool valid = false;

  String? validateEmail() {
    String? email = emailController.text;
    if (email.isNullOrEmpty() ||
        !AppRegex.emailValidationRegex.hasMatch(email)) {
      return "This Email is not valid";
    }
    return null;
  }

  void doIntent(ForgetPasswordViewAction action) {
    switch (action) {
      case FormDataChangedAction():
        {
          _updateValidationState();
        }
      case ForgetPasswordAction():
        {
          _forgetPassword();
        }
    }
  }

  void _forgetPassword() async {
    String email = emailController.text;
    if (!forgetPasswordFormKey.currentState!.validate()) {
      emit(FormErrorState());
      return;
    }
    emit(ForgetPasswordLoadingState());
    var response = await _forgetPasswordUseCase
        .callForgetPasswordUseCase(ForgetPasswordRequest(email: email));
    emit(PopDialogState());
    switch (response) {
      case Success<ForgetPasswordResponse>():
        emit(PopDialogState());
        emit(ForgetPasswordSuccessState());
        break;
      case Failures<ForgetPasswordResponse>():
        emit(PopDialogState());
        final error = ErrorHandler.fromException(response.exception);
        emit(ForgetPasswordFailState(error.errorMassage));
        break;
    }
  }

  void _updateValidationState() {
    if (emailController.text.isEmpty) {
      valid = false;
    } else if (!forgetPasswordFormKey.currentState!.validate()) {
      valid = false;
    } else {
      valid = true;
    }
    emit(UpdateValidationState());
  }
}
