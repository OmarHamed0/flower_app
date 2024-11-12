import 'package:either_dart/src/either.dart';
import 'package:flower_app/src/data/data_sources/offline_data_source/offline_data_source.dart';
import 'package:flower_app/src/data/data_sources/online_data_source/online_data_source.dart';
import 'package:flower_app/src/domain/entities/user_entity.dart';
import 'package:flower_app/src/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements  AuthRepository{
  OnlineDataSource _onlineDataSource;
  OfflineDataSource _offlineDataSource;
  AuthRepositoryImpl(this._offlineDataSource,this._onlineDataSource);

  @override
  Future<Either<String, UserEntity>> getLoggedUserData() {
    // TODO: implement getLoggedUserData
    throw UnimplementedError();
  }

  @override
  Future<void> signIn(String email, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }


}