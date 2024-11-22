import 'package:flower_app/src/data/api/core/response_model/auth_response_models/signin_response_model.dart';
import 'package:flower_app/src/data/models/auth/usr_model_dto.dart';

import '../../../../common/api_result.dart';
import '../../models/auth/signup/request/sign_up_user_body.dart';
import '../../models/auth/signup/response/sign_up_response.dart';

abstract class SignInOnlineDataSource {
  Future<SignInResponseModel> signIn(String email, String password);

  Future<UserModelDTO> getLoggedUserData();

  Future<ApiResult<SignupResponseDto>> signUp(
      SignUpRequestBody signUpRequestBody);
}
