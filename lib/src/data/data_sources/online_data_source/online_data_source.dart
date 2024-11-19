import 'package:flower_app/src/data/api/core/response_model/signin_response_model.dart';
import 'package:flower_app/src/data/models/usr_model_dto.dart';

abstract class SignInOnlineDataSource{
  Future<SignInResponseModel> signIn(String email,String password);
  Future<UserModelDTO> getLoggedUserData();
  Future<ApiResult<SignupResponseDto>> signUp(SignUpRequestBody signUpRequestBody);
}