import 'package:dio/dio.dart';
import 'package:flower_app/src/data/api/core/response_model/product_response_models/one_product_response_model.dart';
import 'package:flower_app/src/data/models/auth/signup/request/sign_up_user_body.dart';
import 'package:flower_app/src/data/models/auth/signup/response/sign_up_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import 'core/constants/apis_baseurl.dart';
import 'core/constants/apis_end_points.dart';
import 'core/requestes_models/signin_request_body.dart';
import 'core/response_model/auth_response_models/logged_user_data_reponse_model.dart';
import 'core/response_model/auth_response_models/signin_response_model.dart';
import 'core/response_model/beset_seller/beset_seller_model.dart';
import 'core/response_model/product/product_response_model.dart';

part 'api_services.g.dart';

@singleton
@injectable
@RestApi(baseUrl: ApisBaseurl.BaseUrl)
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


  @GET("${ApisEndPoints.products}/{id}")
  Future<OneProductResponseModel> getProductById(@Path("id") String id);


  @GET(ApisEndPoints.products)
  Future<ProductResponseModel> getProduct({@Queries()  Map<String ,dynamic> ? query });

  @GET(ApisEndPoints.bestSeller)
  Future<BesetSellerModel> getProductBesetSeller({@Queries()  Map<String ,dynamic>?  query });


}