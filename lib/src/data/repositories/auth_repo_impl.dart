import 'package:either_dart/src/either.dart';
import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/data/api/core/error/error_handler.dart';
import 'package:flower_app/src/data/api/core/response_model/signin_response_model.dart';
import 'package:flower_app/src/data/data_sources/offline_data_source/offline_data_source.dart';
import 'package:flower_app/src/data/data_sources/online_data_source/online_data_source.dart';
import 'package:flower_app/src/data/models/sign_in_response_dto.dart';
import 'package:flower_app/src/domain/entities/sign_in_entity.dart';
import 'package:flower_app/src/domain/entities/user_entity.dart';
import 'package:flower_app/src/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  OnlineDataSource _onlineDataSource;
  OfflineDataSource _offlineDataSource;

  AuthRepositoryImpl(this._offlineDataSource, this._onlineDataSource);

  @override
  Future<Either<String, UserEntity>> getLoggedUserData() {
    // TODO: implement getLoggedUserData
    throw UnimplementedError();
  }

  @override
  Future<ApiResult<SignInEntity>> signIn(String email, String password) async {
    try {
      var response = await _onlineDataSource.signIn(email, password);
      _offlineDataSource.saveToken(response.token!);
      return Success(data: SignInResponseDto.toDomain(response));
    }on Exception catch(e){
      return Failures(exception: e);
    }
  }

  @override
  Future<bool> isLoggedUser() async{
    return _offlineDataSource.isLoggedUser();
  }
}