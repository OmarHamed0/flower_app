

import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/domain/entities/auth/reset_password_entity.dart';
import 'package:flower_app/src/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordUseCase{
  final  AuthRepository _authRepository;
  ResetPasswordUseCase(this._authRepository);

  Future<ApiResult<ResetPasswordEntity>> resetPassword(String oldPassword,String newPassword) async {
    return await _authRepository.resetPassword(oldPassword, newPassword);
  }

  Future<ApiResult<void>> logout() async {
     return await _authRepository.logOut();
  }
}