import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/domain/entities/auth/sign_in_entity.dart';
import 'package:injectable/injectable.dart';

import '../../repositories/auth_repo.dart';

@injectable
class SignInUseCase {
  AuthRepository _signInRepo;
  SignInUseCase(this._signInRepo);

  Future<ApiResult<SignInEntity>> signIn(String email, String password) async {
    return await _signInRepo.signIn(email, password);
  }

  Future<bool> isLoggedUser() async {
    return await _signInRepo.isLoggedUser();
  }
}
