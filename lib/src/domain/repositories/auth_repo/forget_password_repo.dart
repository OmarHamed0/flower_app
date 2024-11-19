import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/domain/entities/auth_request/forget_password_request.dart';
import 'package:flower_app/src/domain/entities/auth_response/forget_password_response.dart';

abstract class ForgetPasswordRepository {
  Future<ApiResult<ForgetPasswordResponse>> forgetPassword(
      ForgetPasswordRequest requestBody);
}
