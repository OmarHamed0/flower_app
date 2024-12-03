import 'package:flower_app/common/api_execute.dart';
import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/data/api/core/requestes_models/reset_password_request_model.dart';
import 'package:flower_app/src/data/data_sources/offline_data_source/offline_data_source.dart';
import 'package:flower_app/src/data/data_sources/online_data_source/auth_datasource/online_data_source.dart';
import 'package:flower_app/src/data/models/auth/reset_password_dto.dart';
import 'package:flower_app/src/data/models/auth/signup/request/sign_up_user_body.dart';
import 'package:flower_app/src/data/models/auth/signup/response/sign_up_response.dart';
import 'package:flower_app/src/domain/entities/auth/edit_profile_model.dart';
import 'package:flower_app/src/domain/entities/auth/reset_password_entity.dart';
import 'package:flower_app/src/domain/entities/auth/sign_in_entity.dart';
import 'package:flower_app/src/domain/entities/auth/signup/sign_up_response.dart';
import 'package:flower_app/src/domain/entities/auth/signup/sign_up_user.dart';
import 'package:flower_app/src/domain/entities/auth/user_entity.dart';
import 'package:flower_app/src/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

import '../../models/auth/sign_in_response_dto.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthOnlineDataSource _onlineDataSource;
  AuthOfflineDataSource _offlineDataSource;

  AuthRepositoryImpl(this._offlineDataSource, this._onlineDataSource);

  @override
  Future<ApiResult<SignupResponse>> signUp(SignUpUser user) async {
    try {
      var response =
          await _onlineDataSource.signUp(SignUpRequestBody.fromDomain(user));
      SignupResponseDto dto = SignupResponseDto();
      var result = dto.toDomain();
      return Success(data: result);
    } on Exception catch (e) {
      return Failures(exception: e);
    }
  }

  @override
  Future<ApiResult<UserEntity>> getLoggedUserData() async {
    return await executeApi<UserEntity>(apiCall: () async {
      var token = await _offlineDataSource.getToken();

      var response = await _onlineDataSource.getLoggedUserData(token ?? '');
      UserEntity userEntity = UserEntity(
        email: response.email,
        firstName: response.firstName,
        lastName: response.lastName,
        id: response.id,
        gender: response.gender,
        phone: response.phone,
        photo: response.photo,
      );
      return userEntity;
    });
  }

  @override
  Future<ApiResult<SignInEntity>> signIn(String email, String password) async {
    try {
      var response = await _onlineDataSource.signIn(email, password);
      _offlineDataSource.saveToken(response.token!);
      return Success(data: SignInResponseDto.toDomain(response));
    } on Exception catch (e) {
      return Failures(exception: e);
    }
  }

  @override
  Future<bool> isLoggedUser() async {
    return _offlineDataSource.isLoggedUser();
  }

  @override
  Future<ApiResult<void>> logOut() async {
    return executeApi<void>(apiCall: () async {
      await _onlineDataSource.logOut();
      await _offlineDataSource.deleteToken();
    });
  }

  @override
  Future<ApiResult<UserEntity>> editProfile(EditProfileModel user) async {
    return await executeApi<UserEntity>(apiCall: () async {
      var response = await _onlineDataSource.editProfile(user.toRequest());
      UserEntity userEntity = UserEntity(
        email: response.email,
        firstName: response.firstName,
        lastName: response.lastName,
        id: response.id,
        gender: response.gender,
        phone: response.phone,
        photo: response.photo,
      );
      return userEntity;
    });
  }

  // @override
  // Future<ApiResult<void>> uploadPhoto(File path) async {
  //   return executeApi<void>(apiCall: () async {
  //     await _onlineDataSource.uploadPhoto(path);
  //   });
  // }

  @override
  Future<ApiResult<ResetPasswordEntity>> resetPassword(
      String oldPassword, String newPassword) async {
    String currentToken = await _offlineDataSource.getToken() ?? "";
    currentToken = "Bearer $currentToken";
    String? newToken;
    ResetPasswordRequestModel resetPasswordRequestModel =
        ResetPasswordRequestModel(
      password: oldPassword,
      newPassword: newPassword,
    );
    var statue = await executeApi<ResetPasswordEntity>(apiCall: () async {
      var response = await _onlineDataSource.resetPassword(
          currentToken, resetPasswordRequestModel);
      newToken = response.token;
      return ResetPasswordDto.toDomain(response);
    });
    await _updateToken(statue, newToken);
    return statue;
  }

  Future<void> _updateToken(
      ApiResult<ResetPasswordEntity> statue, String? newToken) async {
    switch (statue) {
      case Success<ResetPasswordEntity>():
        await _offlineDataSource.saveToken(newToken!);
        break;
      case Failures<ResetPasswordEntity>():
      // TODO: Handle this case.
    }
  }
}
