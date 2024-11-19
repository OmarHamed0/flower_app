import 'package:flower_app/common/api_execute.dart';
import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/data/api/api_services.dart';
import 'package:flower_app/src/data/data_sources/online_data_source/online_data_source.dart';
import 'package:flower_app/src/data/models/auth/signup/request/sign_up_user_body.dart';
import 'package:flower_app/src/data/models/auth/signup/response/sign_up_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OnlineDataSource)
class OnlineDataSourceImpl implements OnlineDataSource {
  ApiServices _apiServices;

  OnlineDataSourceImpl(this._apiServices);

  @override
  Future<ApiResult<SignupResponseDto>> signUp(SignUpRequestBody signUpRequestBody) async {
    return executeApi<SignupResponseDto>(
      apiCall: () async {
        var response = await _apiServices.signUp(signUpRequestBody);
        return response;

      },
    );
  }

}
