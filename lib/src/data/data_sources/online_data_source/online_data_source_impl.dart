import 'package:flower_app/config/helpers/shared_pre_keys.dart';
import 'package:flower_app/config/helpers/shared_pref_helper.dart';
import 'package:flower_app/src/data/api/api_services.dart';
import 'package:flower_app/src/data/api/core/requestes_models/signin_request_body.dart';
import 'package:flower_app/src/data/api/core/response_model/auth_response_models/signin_response_model.dart';
import 'package:flower_app/src/data/data_sources/online_data_source/online_data_source.dart';
import 'package:flower_app/src/data/models/auth/signup/request/sign_up_user_body.dart';
import 'package:flower_app/src/data/models/auth/signup/response/sign_up_response.dart';
import 'package:flower_app/src/data/models/auth/usr_model_dto.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/api_execute.dart';
import '../../../../common/api_result.dart';

@Injectable(as: SignInOnlineDataSource)
class SignInOnlineDataSourceImpl implements SignInOnlineDataSource {
  ApiServices _apiServices;

  SignInOnlineDataSourceImpl(this._apiServices);

  @override
  Future<UserModelDTO> getLoggedUserData() async {
    String token = SharedPrefHelper.getSecureString(SharedPrefKeys.userToken);
    var response = await _apiServices.getLoggedUserData(token);
    return UserModelDTO.fromResponse(response);
  }

  @override
  Future<ApiResult<SignupResponseDto>> signUp(
      SignUpRequestBody signUpRequestBody) async {
    return executeApi<SignupResponseDto>(
      apiCall: () async {
        var response = await _apiServices.signUp(signUpRequestBody);
        return response;
      },
    );
  }

  Future<SignInResponseModel> signIn(String email, String password) async {
    var response = await _apiServices
        .signIn(SignInRequestBody(email: email, password: password));
    return response;
  }
}
