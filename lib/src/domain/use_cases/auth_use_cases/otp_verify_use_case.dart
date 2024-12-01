import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/domain/entities/auth_request/otp_verify_request.dart';
import 'package:flower_app/src/domain/entities/auth_response/otp_verify_response.dart';
import 'package:flower_app/src/domain/repositories/auth_repo/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class OtpVerifyUseCase {
  final ForgetPasswordRepository _repository;

  OtpVerifyUseCase(this._repository);

  Future<ApiResult<OtpVerifyResponse>> callOtpVerifyUseCase(
      OtpVerifyRequest resetCode) async {
    var response = await _repository.otpVerify(resetCode);
    return response;
  }
}
