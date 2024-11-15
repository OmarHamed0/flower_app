import 'package:flower_app/src/data/models/usr_model_dto.dart';

abstract class OfflineDataSource{
  Future<UserModelDTO> getCachedLoggedUser();
  Future<bool> isLoggedUser();
  Future<void> saveToken(String token);
  Future<void> deleteToken();
}