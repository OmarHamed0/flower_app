import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/data/data_sources/online_data_source/online_data_source.dart';
import 'package:flower_app/src/data/dto/auth_response_dto/forget_password_response_dto.dart';
import 'package:flower_app/src/data/dto/auth_response_dto/otp_verify_response_dto.dart';
import 'package:flower_app/src/data/dto/auth_response_dto/reset_password_response_dto.dart';
import 'package:flower_app/src/domain/entities/auth_request/forget_password_request.dart';
import 'package:flower_app/src/domain/entities/auth_request/otp_verify_request.dart';
import 'package:flower_app/src/domain/entities/auth_request/reset_password_request.dart';
import 'package:flower_app/src/domain/entities/auth_response/forget_password_response.dart';
import 'package:flower_app/src/domain/entities/auth_response/otp_verify_response.dart';
import 'package:flower_app/src/domain/entities/auth_response/reset_password_response.dart';
import 'package:flower_app/src/domain/repositories/auth_repo/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForgetPasswordRepository)
class ForgetPasswordRepositoryImpl implements ForgetPasswordRepository {
  final SignInOnlineDataSource _onlineDataSource;

  ForgetPasswordRepositoryImpl(this._onlineDataSource);

  @override
  Future<ApiResult<ForgetPasswordResponse>> forgetPassword(
      ForgetPasswordRequest requestBody) async {
    try {
      await _onlineDataSource.forgetPassword(requestBody);
      return Success(data: ForgetPasswordResponseDto().toDomain());
    } on Exception catch (e) {
      return Failures(exception: e);
    }
  }

  @override
  Future<ApiResult<OtpVerifyResponse>> otpVerify(
      OtpVerifyRequest resetCode) async {
    try {
      await _onlineDataSource.verifyResetCode(resetCode);
      return Success(data: OtpVerifyResponseDto().toDomain());
    } on Exception catch (ex) {
      return Failures(exception: ex);
    }
  }

  @override
  Future<ApiResult<ResetPasswordResponse>> resetPassword(
      ResetPasswordRequest request) async {
    try{
      await _onlineDataSource.resetPassword(request);
      return Success(data: ResetPasswordResponseDto().toDomain());
    }on Exception catch (ex){
      return Failures(exception: ex);
    }
  }
}
