import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/data/models/auth/signup/request/sign_up_user_body.dart';
import 'package:flower_app/src/data/models/auth/signup/response/sign_up_response.dart';

abstract class OnlineDataSource{
  Future<ApiResult<SignupResponseDto>> signUp(SignUpRequestBody signUpRequestBody);
}