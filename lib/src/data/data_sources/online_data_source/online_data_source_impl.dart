import 'package:flower_app/src/data/api/api_services.dart';
import 'package:flower_app/src/data/api/core/requestes_models/signin_request_body.dart';
import 'package:flower_app/src/data/api/core/response_model/signin_response_model.dart';
import 'package:flower_app/src/data/data_sources/online_data_source/online_data_source.dart';
import 'package:flower_app/src/data/models/usr_model_dto.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OnlineDataSource)
class OnlineDataSourceImpl implements OnlineDataSource {
  ApiServices _apiServices;

  OnlineDataSourceImpl(this._apiServices);

  @override
  Future<SignInResponseModel> signin(String email, String password) {
    return _apiServices
        .signIn(SignInRequestBody(email: email, password: password));
  }

  @override
  Future<UserModelDTO> getLoggedUserData() async {
    var response = await _apiServices.getLoggedUserData("");
    return UserModelDTO.fromResponse(response);
  }
}
