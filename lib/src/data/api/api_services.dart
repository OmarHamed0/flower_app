import 'package:dio/dio.dart';
import 'package:flower_app/src/data/api/core/constants/apis_end_points.dart';
import 'package:flower_app/src/data/api/core/requestes_models/signin_request_body.dart';
import 'package:flower_app/src/data/api/core/response_model/logged_user_data_reponse_model.dart';
import 'package:flower_app/src/data/api/core/response_model/signin_response_model.dart';
import 'package:flower_app/src/data/dto/auth_request_dto/forget_password_request_dto.dart';
import 'package:flower_app/src/data/dto/auth_request_dto/otp_verify_request_dto.dart';
import 'package:flower_app/src/data/dto/auth_request_dto/reset_password_request_dto.dart';
import 'package:flower_app/src/data/dto/auth_response_dto/forget_password_response_dto.dart';
import 'package:flower_app/src/data/dto/auth_response_dto/reset_password_response_dto.dart';
import 'package:flower_app/src/data/dto/auth_response_dto/verify_reset_code_response_dto.dart';
import 'package:flower_app/src/data/models/auth/signup/request/sign_up_user_body.dart';
import 'package:flower_app/src/data/models/auth/signup/response/sign_up_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import 'core/constants/apis_baseurl.dart';

part 'api_services.g.dart';

@singleton
@injectable
@RestApi(baseUrl: ApisBaseurl.authBaseUrl)
abstract class ApiServices {
  @factoryMethod
  factory ApiServices(Dio dio) = _ApiServices;

  @POST(ApisEndPoints.signup)
  Future<SignupResponseDto> signUp(@Body() SignUpRequestBody requestBody);

  @POST(ApisEndPoints.signin)
  Future<SignInResponseModel> signIn(@Body() SignInRequestBody requestBody);

  @GET(ApisEndPoints.loggedUserData)
  Future<LoggedUserDataResponseModel> getLoggedUserData(
      @Header("token") String token);

  @POST(ApisEndPoints.forgetPasswordEndpoint)
  Future<ForgetPasswordResponseDto> forgetPassword(
      @Body() ForgetPasswordRequestDto requestBody);

  @POST(ApisEndPoints.verifyRestCodeEndPoint)
  Future<VerifyResetCodeResponseDto> verifyResetCode(
      @Body() OtpVerifyRequestDto resetCode);

  @PUT(ApisEndPoints.resetPasswordEndpoint)
  Future<ResetPasswordResponseDto> resetPassword(
      @Body() ResetPasswordRequestDto request);
}
