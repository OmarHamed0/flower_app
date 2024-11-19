import 'package:dio/dio.dart';
import 'package:flower_app/src/data/models/auth/signup/request/sign_up_user_body.dart';
import 'package:flower_app/src/data/models/auth/signup/response/sign_up_response.dart';
import 'package:flower_app/src/domain/entities/auth/signup/sign_up_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'core/constants/apis_baseurl.dart';
import 'core/constants/apis_end_points.dart';
part 'api_services.g.dart';
@singleton
@injectable
@RestApi(baseUrl: ApisBaseurl.authBaseUrl)
abstract class ApiServices{
  @factoryMethod
  factory ApiServices(Dio dio) = _ApiServices;

  @POST(ApisEndPoints.signup)
  Future<SignupResponseDto> signUp(@Body() SignUpRequestBody requestBody);

}
