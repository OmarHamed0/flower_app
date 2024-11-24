import 'package:flower_app/src/data/api/core/response_model/signin_response_model.dart';
import 'package:flower_app/src/data/models/usr_model_dto.dart';
import 'package:flower_app/src/domain/entities/auth_request/forget_password_request.dart';
import 'package:flower_app/src/domain/entities/auth_request/otp_verify_request.dart';
import 'package:flower_app/src/domain/entities/auth_request/reset_password_request.dart';
import 'package:flower_app/src/domain/entities/auth_response/forget_password_response.dart';
import 'package:flower_app/src/domain/entities/auth_response/reset_password_response.dart';
import 'package:flower_app/src/domain/entities/auth_response/verify_reset_code_response.dart';

import '../../../../common/api_result.dart';
import '../../models/auth/signup/request/sign_up_user_body.dart';
import '../../models/auth/signup/response/sign_up_response.dart';

abstract class SignInOnlineDataSource {
  Future<SignInResponseModel> signIn(String email, String password);

  Future<UserModelDTO> getLoggedUserData();

  Future<ApiResult<SignupResponseDto>> signUp(
      SignUpRequestBody signUpRequestBody);

  Future<ApiResult<ForgetPasswordResponse>> forgetPassword(
      ForgetPasswordRequest requestBody);

  Future<ApiResult<VerifyResetCodeResponse>> verifyResetCode(
      OtpVerifyRequest resetCode);

  Future<ApiResult<ResetPasswordResponse>> resetPassword(
      ResetPasswordRequest request);
}
