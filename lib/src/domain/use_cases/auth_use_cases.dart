import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/domain/entities/sign_in_entity.dart';
import 'package:flower_app/src/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthUseCases{
  AuthRepository _authRepository;
  AuthUseCases(this._authRepository);

  Future<ApiResult<SignInEntity>> signIn(String email,String password) async{
    return await _authRepository.signIn(email, password);
  }

}