import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/domain/entities/auth/signup/sign_up_response.dart';
import 'package:flower_app/src/domain/entities/auth/signup/sign_up_user.dart';

abstract class AuthRepository{
  Future<ApiResult<SignupResponse>> signUp(SignUpUser user);
}