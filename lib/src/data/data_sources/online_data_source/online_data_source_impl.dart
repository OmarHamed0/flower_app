import 'package:flower_app/common/api_execute.dart';
import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/config/helpers/shared_pre_keys.dart';
import 'package:flower_app/config/helpers/shared_pref_helper.dart';
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
  Future<UserModelDTO> getLoggedUserData() async {
    String token = SharedPrefHelper.getSecureString(SharedPrefKeys.userToken);
    var response = await _apiServices.getLoggedUserData(token);
    return UserModelDTO.fromResponse(response);
  }

  @override
  Future<ApiResult<SignInResponseModel>> signIn(
      String email, String password) async {
    var response = await executeApi<SignInResponseModel>(apiCall: () async {
      return await _apiServices
          .signIn(SignInRequestBody(email: email, password: password));
    });
    switch (response) {
      case Success<SignInResponseModel>():
        SharedPrefHelper.setSecureString(
            SharedPrefKeys.userToken, response.data!.token ?? "");
      case Failures<SignInResponseModel>():
    }
    return response;
  }
}
