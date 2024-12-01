import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/domain/entities/auth_request/forget_password_request.dart';
import 'package:flower_app/src/domain/entities/auth_response/forget_password_response.dart';
import 'package:flower_app/src/domain/repositories/auth_repo/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordUseCase {
  final ForgetPasswordRepository _forgetPasswordRepository;

  ForgetPasswordUseCase(this._forgetPasswordRepository);

  Future<ApiResult<ForgetPasswordResponse>> callForgetPasswordUseCase(
      ForgetPasswordRequest requestBody) async {
    var response = await _forgetPasswordRepository.forgetPassword(requestBody);
    return response;
  }
}
