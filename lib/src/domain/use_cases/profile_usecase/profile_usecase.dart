import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/domain/entities/auth/user_entity.dart';
import 'package:injectable/injectable.dart';

import '../../repositories/auth_repo.dart';

@injectable
class ProfileUseCase {
  final AuthRepository _signInRepo;
  ProfileUseCase(this._signInRepo);
  Future<ApiResult<UserEntity>> getUserData() async {
    return await _signInRepo.getLoggedUserData();
  }

  Future<ApiResult<void>> logOut() async {
    return await _signInRepo.logOut();
  }
}
