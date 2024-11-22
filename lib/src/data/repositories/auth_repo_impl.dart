import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/data/data_sources/offline_data_source/offline_data_source.dart';
import 'package:flower_app/src/data/data_sources/online_data_source/online_data_source.dart';
import 'package:flower_app/src/data/models/auth/signup/request/sign_up_user_body.dart';
import 'package:flower_app/src/data/models/auth/signup/response/sign_up_response.dart';
import 'package:flower_app/src/domain/entities/auth/signup/sign_up_response.dart';
import 'package:flower_app/src/domain/entities/auth/signup/sign_up_user.dart';
import 'package:flower_app/src/domain/entities/auth/sign_in_entity.dart';
import 'package:flower_app/src/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  SignInOnlineDataSource _onlineDataSource;
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
  Future<bool> isLoggedUser() {
    // TODO: implement isLoggedUser
    throw UnimplementedError();
  }

  @override
  Future<ApiResult<SignInEntity>> signIn(String email, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }
}
