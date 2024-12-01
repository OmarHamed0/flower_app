import 'package:flower_app/config/extensions/extensions.dart';
import 'package:flower_app/config/helpers/shared_pre_keys.dart';
import 'package:flower_app/config/helpers/shared_pref_helper.dart';
import 'package:flower_app/src/data/data_sources/offline_data_source/offline_data_source.dart';
import 'package:flower_app/src/data/models/auth/usr_model_dto.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthOfflineDataSource)
class AuthOfflineDataSourceImpl implements AuthOfflineDataSource {
  @override
  Future<UserModelDTO> getCachedLoggedUser() {
    // TODO: implement getCachedLoggedUser
    throw UnimplementedError();
  }

  @override
  Future<bool> isLoggedUser() async {
    var token =
        await SharedPrefHelper.getSecureString(SharedPrefKeys.userToken);
    return (token?.isNullOrEmpty() == true);
  }

  @override
  Future<void> deleteToken() async {
    print('====================deleteToken');
    await SharedPrefHelper.removeSecureString(SharedPrefKeys.userToken);
  }

  @override
  Future<void> saveToken(String token) async {
    await SharedPrefHelper.setSecureString(SharedPrefKeys.userToken, token);
  }

  @override
  Future<String?> getToken() async{
    return await SharedPrefHelper.getSecureString(SharedPrefKeys.userToken);
  }
}
