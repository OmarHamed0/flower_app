import 'package:flower_app/src/data/models/usr_model_dto.dart';

abstract class SignInOfflineDataSource {
  Future<UserModelDTO> getCachedLoggedUser();

  Future<bool> isLoggedUser();

  Future<void> saveToken(String token);

  Future<void> deleteToken();
}
