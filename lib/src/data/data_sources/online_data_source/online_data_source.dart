import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/data/models/auth/signup/request/sign_up_user_body.dart';
import 'package:flower_app/src/data/models/auth/signup/response/sign_up_response.dart';

abstract class OnlineDataSource{
  Future<ApiResult<SignupResponseDto>> signUp(SignUpRequestBody signUpRequestBody);
import 'package:flower_app/src/data/api/core/response_model/signin_response_model.dart';
import 'package:flower_app/src/data/models/usr_model_dto.dart';

abstract class SignInOnlineDataSource{
  Future<SignInResponseModel> signIn(String email,String password);
  Future<UserModelDTO> getLoggedUserData();
}