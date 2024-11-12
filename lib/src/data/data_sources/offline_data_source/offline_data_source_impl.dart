import 'package:flower_app/src/data/api/core/response_model/signin_response_model.dart';
import 'package:flower_app/src/data/data_sources/offline_data_source/offline_data_source.dart';
import 'package:flower_app/src/data/models/usr_model_dto.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: OfflineDataSource)
class OfflineDataSourceImpl implements OfflineDataSource{
  @override
  Future<UserModelDTO> getCachedLoggedUser() {
    // TODO: implement getCachedLoggedUser
    throw UnimplementedError();
  }

  @override
  Future<SignInResponseModel> getCachedToken() {
    // TODO: implement getCachedToken
    throw UnimplementedError();
  }

}