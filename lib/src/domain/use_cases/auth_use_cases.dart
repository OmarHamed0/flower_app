


import 'package:flower_app/src/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthUseCase{
  AuthRepository _authRepository;
  AuthUseCase(this._authRepository);
}