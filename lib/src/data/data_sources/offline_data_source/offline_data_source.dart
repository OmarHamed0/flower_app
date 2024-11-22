import '../../models/auth/usr_model_dto.dart';

abstract class SignInOfflineDataSource {
  Future<UserModelDTO> getCachedLoggedUser();

  Future<bool> isLoggedUser();

  Future<void> saveToken(String token);

  Future<void> deleteToken();
}
