import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/data/data_sources/offline_data_source/offline_data_source.dart';
import 'package:flower_app/src/data/data_sources/online_data_source/online_data_source.dart';
import 'package:flower_app/src/data/models/sign_in_response_dto.dart';
import 'package:flower_app/src/domain/entities/sign_in_entity.dart';
import 'package:flower_app/src/domain/repositories/auth_repo/sign_in_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignInRepo)
class SignInRepositoryImpl implements SignInRepo {
  OnlineDataSource _signInOnlineDataSource;
  SignInOfflineDataSource _signInOfflineDataSource;

  SignInRepositoryImpl(
      this._signInOfflineDataSource, this._signInOnlineDataSource);

  // @override
  // Future<Either<String, UserEntity>> getLoggedUserData() {
  //   // TODO: implement getLoggedUserData
  //   throw UnimplementedError();
  // }

  @override
  Future<ApiResult<SignInEntity>> signIn(String email, String password) async {
    try {
      var response = await _signInOnlineDataSource.signIn(email, password);
      _signInOfflineDataSource.saveToken(response.token!);
      return Success(data: SignInResponseDto.toDomain(response));
    } on Exception catch (e) {
      return Failures(exception: e);
    }
  }

  @override
  Future<bool> isLoggedUser() async {
    return _signInOfflineDataSource.isLoggedUser();
  }
}
