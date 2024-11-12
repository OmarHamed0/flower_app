import 'package:dio/dio.dart';
import 'package:flower_app/src/data/api/core/apis_end_points.dart';
import 'package:flower_app/src/data/api/core/requestes_models/signin_request_body.dart';
import 'package:flower_app/src/data/api/core/response_model/logged_user_data_reponse_model.dart';
import 'package:flower_app/src/data/api/core/response_model/signin_response_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'core/constants/apis_baseurl.dart';
part 'api_services.g.dart';
@injectable
@RestApi(baseUrl: ApisBaseurl.authBaseUrl)
abstract class ApiServices{
  @factoryMethod
  factory ApiServices(Dio dio) = _ApiServices;


  @POST(ApisEndPoints.signin)
  Future<SignInResponseModel> signIn(@Body() SignInRequestBody requestBody);

  @GET(ApisEndPoints.loggedUserData)
  Future<LoggedUserDataResponseModel> getLoggedUserData(@Header("token") String token);

}
