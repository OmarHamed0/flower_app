import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/domain/entities/sign_in_entity.dart';
import 'package:flower_app/src/domain/repositories/auth_repo/sign_in_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInUseCase{
  SignInRepo _signInRepo;

  SignInUseCase(this._signInRepo);

  Future<ApiResult<SignInEntity>> signIn(String email,String password) async{
    return await _signInRepo.signIn(email, password);
  }
  Future<bool> isLoggedUser() async{
     return await _signInRepo.isLoggedUser();
  }
}
