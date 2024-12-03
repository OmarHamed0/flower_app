import 'package:flower_app/src/data/api/core/requestes_models/reset_password_request_model.dart';
import 'package:flower_app/src/data/api/core/response_model/auth_response_models/reset_password_response_model.dart';
import 'package:flower_app/src/data/api/core/response_model/auth_response_models/signin_response_model.dart';

import '../../../../../common/api_result.dart';
import '../../../api/core/requestes_models/edit_profile_request.dart';
import '../../../api/core/response_model/logout/Logout_response.dart';
import '../../../models/auth/signup/request/sign_up_user_body.dart';
import '../../../models/auth/signup/response/sign_up_response.dart';
import '../../../models/auth/usr_model_dto.dart';

abstract class AuthOnlineDataSource {
  Future<SignInResponseModel> signIn(String email, String password);

  Future<UserModelDTO> getLoggedUserData();

  Future<ApiResult<SignupResponseDto>> signUp(
      SignUpRequestBody signUpRequestBody);

  Future<LogOutResponse> logOut();
  // Future<String> uploadPhoto(File photo);

  Future<UserModelDTO> editProfile(EditProfileRequest body);

  Future<ResetPasswordResponseModel> resetPassword(String token,ResetPasswordRequestModel resetPasswordRequestModel);

}
