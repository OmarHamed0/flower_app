
import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/domain/entities/auth/edit_profile_model.dart';
import 'package:flower_app/src/domain/entities/auth/reset_password_entity.dart';
import 'package:flower_app/src/domain/entities/auth/signup/sign_up_response.dart';
import 'package:flower_app/src/domain/entities/auth/signup/sign_up_user.dart';
import 'package:flower_app/src/domain/entities/auth/user_entity.dart';

import '../entities/auth/sign_in_entity.dart';

abstract class AuthRepository {
  Future<ApiResult<SignupResponse>> signUp(SignUpUser user);
  Future<ApiResult<SignInEntity>> signIn(String email, String password);
  Future<bool> isLoggedUser();
  Future<ApiResult<UserEntity>> getLoggedUserData();
  Future<ApiResult<void>> logOut();
  Future<ApiResult<UserEntity>> editProfile(EditProfileModel user);
  Future<ApiResult<ResetPasswordEntity>> resetPassword(
      String oldPassword, String newPassword);
}
