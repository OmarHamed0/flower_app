import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/domain/entities/auth_request/reset_password_request.dart';
import 'package:flower_app/src/domain/entities/auth_response/reset_password_response.dart';
import 'package:flower_app/src/domain/repositories/auth_repo/forget_password_repo.dart';
import 'package:flower_app/src/domain/use_cases/auth_use_cases/forget_password_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordUseCase {
  final ForgetPasswordRepository _forgetPasswordRepository;

  ResetPasswordUseCase(this._forgetPasswordRepository);

  Future<ApiResult<ResetPasswordResponse>> callResetPasswordUseCase(
      ResetPasswordRequest request) async {
    var response = await _forgetPasswordRepository.resetPassword(request);
    return response;
  }
}