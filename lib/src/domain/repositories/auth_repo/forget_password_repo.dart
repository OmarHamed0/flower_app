import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/domain/entities/auth_request/forget_password_request.dart';
import 'package:flower_app/src/domain/entities/auth_request/otp_verify_request.dart';
import 'package:flower_app/src/domain/entities/auth_response/forget_password_response.dart';
import 'package:flower_app/src/domain/entities/auth_response/otp_verify_response.dart';

abstract class ForgetPasswordRepository {
  Future<ApiResult<ForgetPasswordResponse>> forgetPassword(
      ForgetPasswordRequest requestBody);

  Future<ApiResult<OtpVerifyResponse>> otpVerify(OtpVerifyRequest resetCode);
}
