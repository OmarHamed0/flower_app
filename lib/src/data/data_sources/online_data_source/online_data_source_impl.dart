import 'package:flower_app/common/api_execute.dart';
import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/config/helpers/shared_pre_keys.dart';
import 'package:flower_app/config/helpers/shared_pref_helper.dart';
import 'package:flower_app/src/data/api/api_services.dart';
import 'package:flower_app/src/data/api/core/requestes_models/signin_request_body.dart';
import 'package:flower_app/src/data/api/core/response_model/signin_response_model.dart';
import 'package:flower_app/src/data/data_sources/online_data_source/online_data_source.dart';
import 'package:flower_app/src/data/dto/auth_request_dto/forget_password_request_dto.dart';
import 'package:flower_app/src/data/dto/auth_request_dto/otp_verify_request_dto.dart';
import 'package:flower_app/src/data/dto/auth_request_dto/reset_password_request_dto.dart';
import 'package:flower_app/src/data/models/auth/signup/request/sign_up_user_body.dart';
import 'package:flower_app/src/data/models/auth/signup/response/sign_up_response.dart';
import 'package:flower_app/src/data/models/usr_model_dto.dart';
import 'package:flower_app/src/domain/entities/auth_request/forget_password_request.dart';
import 'package:flower_app/src/domain/entities/auth_request/otp_verify_request.dart';
import 'package:flower_app/src/domain/entities/auth_request/reset_password_request.dart';
import 'package:flower_app/src/domain/entities/auth_response/forget_password_response.dart';
import 'package:flower_app/src/domain/entities/auth_response/reset_password_response.dart';
import 'package:flower_app/src/domain/entities/auth_response/verify_reset_code_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignInOnlineDataSource)
class SignInOnlineDataSourceImpl implements SignInOnlineDataSource {
  final ApiServices _apiServices;

  SignInOnlineDataSourceImpl(this._apiServices);

  @override
  Future<UserModelDTO> getLoggedUserData() async {
    String token = SharedPrefHelper.getSecureString(SharedPrefKeys.userToken);
    var response = await _apiServices.getLoggedUserData(token);
    return UserModelDTO.fromResponse(response);
  }

  @override
  Future<ApiResult<SignupResponseDto>> signUp(
      SignUpRequestBody signUpRequestBody) async {
    return executeApi<SignupResponseDto>(
      apiCall: () async {
        var response = await _apiServices.signUp(signUpRequestBody);
        return response;
      },
    );
  }

  @override
  Future<SignInResponseModel> signIn(String email, String password) async {
    var response = await _apiServices
        .signIn(SignInRequestBody(email: email, password: password));
    return response;
  }

  @override
  Future<ApiResult<ForgetPasswordResponse>> forgetPassword(
      ForgetPasswordRequest requestBody) async {
    var response = await executeApi<ForgetPasswordResponse>(apiCall: () async {
      var response = await _apiServices
          .forgetPassword(ForgetPasswordRequestDto.fromDomain(requestBody));
      print(response);
      return response.toDomain();
    });
    return response;
  }

  @override
  Future<ApiResult<VerifyResetCodeResponse>> verifyResetCode(
      OtpVerifyRequest resetCode) async {
    var response = executeApi<VerifyResetCodeResponse>(apiCall: () async {
      var response = await _apiServices
          .verifyResetCode(OtpVerifyRequestDto(resetCode: resetCode.resetCode));
      return response.toDomain();
    });
    return response;
  }

  @override
  Future<ApiResult<ResetPasswordResponse>> resetPassword(
      ResetPasswordRequest request) {
    return executeApi(apiCall: () async {
      var response = await _apiServices.resetPassword(ResetPasswordRequestDto(
          email: request.email, newPassword: request.newPassword));
      return response.toDomain();
    });
  }
}
