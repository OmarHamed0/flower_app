
import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/domain/entities/auth/signup/sign_up_response.dart';
import 'package:flower_app/src/domain/entities/auth/signup/sign_up_user.dart';
import 'package:flower_app/src/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignupUserUseCase {

  final AuthRepository _repository;
  const SignupUserUseCase(this._repository);

  Future<ApiResult<SignupResponse>> execute(SignUpUser user) async  {

    return await _repository.signUp(user);
  }

}