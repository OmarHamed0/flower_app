import '../../models/auth/usr_model_dto.dart';

abstract class AuthOfflineDataSource {
  Future<UserModelDTO> getCachedLoggedUser();

  Future<bool> isLoggedUser();

  Future<void> saveToken(String token);

  Future<void> deleteToken();
  Future<String?> getToken();
}
