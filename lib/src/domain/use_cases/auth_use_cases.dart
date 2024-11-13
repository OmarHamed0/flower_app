


import 'package:flower_app/src/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthUseCases{
  AuthRepository _authRepository;
  AuthUseCases(this._authRepository);
}