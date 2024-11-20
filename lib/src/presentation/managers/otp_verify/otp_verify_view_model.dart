import 'package:bloc/bloc.dart';
import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/data/api/core/error/error_handler.dart';
import 'package:flower_app/src/domain/entities/auth_request/otp_verify_request.dart';
import 'package:flower_app/src/domain/entities/auth_response/otp_verify_response.dart';
import 'package:flower_app/src/domain/use_cases/auth_use_cases/otp_verify_use_case.dart';
import 'package:flower_app/src/presentation/managers/otp_verify/otp_verify_action.dart';
import 'package:flower_app/src/presentation/managers/otp_verify/otp_verify_states.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class OtpVerifyViewModel extends Cubit<OtpVerifyViewState> {
  final OtpVerifyUseCase _otpVerifyUseCase;
  GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();

  final List<TextEditingController> controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );

  OtpVerifyViewModel(this._otpVerifyUseCase)
      : super(InitialOtpVerifyViewState());

  doIntent(OtpVerifyViewAction action) {
    switch (action) {
      case OnCompleteCodeVerifyAction():
        {
          _checkAndSubmitOtp();
        }
      case FormDataChangedAction():
      case OtpResendAction():
      // TODO: Handle this case.

      case DisableTimerAction():
      // TODO: Handle this case.
    }
  }

  String _getOtpCode() {
    return controllers.map((controller) => controller.text).join();
  }

  void _checkAndSubmitOtp() {
    if (controllers.every((controller) => controller.text.isNotEmpty)) {
      final otpCode = _getOtpCode();
      print(otpCode);
      _otpVerify(otpCode);
    }
  }

  void _otpVerify(String otpCode) async {
    if (!otpFormKey.currentState!.validate()) {
      emit(OtpFormErrorState());
      return;
    }
    emit(OtpVerifyLoadingState());

    var response = await _otpVerifyUseCase
        .callOtpVerifyUseCase(OtpVerifyRequest(resetCode: otpCode));

    emit(PopDialogState());

    switch (response) {
      case Success<OtpVerifyResponse>():
        emit(OtpSuccessState());
      case Failures<OtpVerifyResponse>():
        final errorMessage = ErrorHandler.fromException(response.exception);
        emit(OtpFailState(errorMessage.errorMassage));
    }
  }
}
