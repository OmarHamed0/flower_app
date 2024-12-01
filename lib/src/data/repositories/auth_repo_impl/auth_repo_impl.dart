import 'package:flower_app/common/api_execute.dart';
import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/data/data_sources/offline_data_source/offline_data_source.dart';
import 'package:flower_app/src/data/data_sources/online_data_source/auth_datasource/online_data_source.dart';
import 'package:flower_app/src/data/models/auth/signup/request/sign_up_user_body.dart';
import 'package:flower_app/src/data/models/auth/signup/response/sign_up_response.dart';
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
  SignInOfflineDataSource _offlineDataSource;

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
      var response = await _onlineDataSource.getLoggedUserData();
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

  // @override
  // Future<ApiResult<void>> uploadPhoto(File path) async {
  //   return executeApi<void>(apiCall: () async {
  //     await _onlineDataSource.uploadPhoto(path);
  //   });
  // }
}
