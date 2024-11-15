import 'package:flower_app/config/helpers/shared_pre_keys.dart';
import 'package:flower_app/config/helpers/shared_pref_helper.dart';
import 'package:flower_app/src/data/api/core/response_model/signin_response_model.dart';
import 'package:flower_app/src/data/data_sources/offline_data_source/offline_data_source.dart';
import 'package:flower_app/src/data/models/usr_model_dto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';



@Injectable(as: OfflineDataSource)
class OfflineDataSourceImpl implements OfflineDataSource{

  @override
  Future<UserModelDTO> getCachedLoggedUser() {
    // TODO: implement getCachedLoggedUser
    throw UnimplementedError();
  }



  @override
  Future<bool> isLoggedUser() async{
    var token = SharedPrefHelper.getSecureString(SharedPrefKeys.userToken);
    return (token.isNullOrEmpty() == true);
  }

  @override
  Future<void> deleteToken() {
    // TODO: implement deleteToken
    throw UnimplementedError();
  }

  @override
  Future<void> saveToken(String token) async{
      await SharedPrefHelper.setSecureString(SharedPrefKeys.userToken, token);
  }

}