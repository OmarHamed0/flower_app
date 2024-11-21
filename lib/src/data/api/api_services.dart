import 'package:dio/dio.dart';
import 'package:flower_app/src/data/models/auth/signup/request/sign_up_user_body.dart';
import 'package:flower_app/src/data/models/auth/signup/response/sign_up_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import 'core/constants/apis_baseurl.dart';
import 'core/constants/apis_end_points.dart';
import 'core/requestes_models/signin_request_body.dart';
import 'core/response_model/home_response/home_response.dart';
import 'core/response_model/logged_user_data_reponse_model.dart';
import 'core/response_model/signin_response_model.dart';

part 'api_services.g.dart';

@singleton
@injectable
@RestApi(baseUrl: ApisBaseurl.baseUrl)
abstract class ApiServices {
  @factoryMethod
  factory ApiServices(Dio dio) = _ApiServices;

  @POST(ApisEndPoints.signup)
  Future<SignupResponseDto> signUp(@Body() SignUpRequestBody requestBody);
  @POST(ApisEndPoints.signin)
  Future<SignInResponseModel> signIn(@Body() SignInRequestBody requestBody);

  @GET(ApisEndPoints.loggedUserData)
  Future<LoggedUserDataResponseModel> getLoggedUserData(
      @Header("token") String token);

  @GET(ApisEndPoints.home)
  Future<HomeResponse> getHomeData();
}
