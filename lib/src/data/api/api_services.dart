import 'package:dio/dio.dart';
import 'package:flower_app/src/data/api/core/requestes_models/reset_password_request_model.dart';
import 'package:flower_app/src/data/api/core/response_model/auth_response_models/reset_password_response_model.dart';
import 'package:flower_app/src/data/api/core/response_model/product_response_models/one_product_response_model.dart';
import 'package:flower_app/src/data/models/auth/signup/request/sign_up_user_body.dart';
import 'package:flower_app/src/data/models/auth/signup/response/sign_up_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import 'core/constants/apis_baseurl.dart';
import 'core/constants/apis_end_points.dart';
import 'core/requestes_models/edit_profile_request.dart';
import 'core/requestes_models/signin_request_body.dart';
import 'core/response_model/auth_response_models/logged_user_data_reponse_model.dart';
import 'core/response_model/auth_response_models/signin_response_model.dart';
import 'core/response_model/beset_seller/beset_seller_model.dart';
import 'core/response_model/get_catigories/get_catigories_resonse_model.dart';
import 'core/response_model/home_response/home_response.dart';
import 'core/response_model/logout/Logout_response.dart';
import 'core/response_model/occasions/occasion_response_model.dart';
import 'core/response_model/product/product_response_model.dart';

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
      @Header("Authorization") String token);

  @GET(ApisEndPoints.home)
  Future<HomeResponse> getHomeData();

  @GET("${ApisEndPoints.products}/{id}")
  Future<OneProductResponseModel> getProductById(@Path("id") String id);

  @GET(ApisEndPoints.products)
  Future<ProductResponseModel> getProduct(
      {@Queries() Map<String, dynamic>? query});

  @GET(ApisEndPoints.bestSeller)
  Future<BesetSellerModel> getProductBesetSeller(
      {@Queries() Map<String, dynamic>? query});

  @GET(ApisEndPoints.categories)
  Future<GetCatigoriesResponseModel> getCategories();
  @GET(ApisEndPoints.occassions)
  Future<OccasionResponseModel> getOccasions();
  @GET(ApisEndPoints.logout)
  Future<LogOutResponse> logout(@Header("Authorization") String token);

  @PUT(ApisEndPoints.editProfile)
  Future<LoggedUserDataResponseModel> editProfile(
      @Header("Authorization") String token, @Body() EditProfileRequest body);

  // @PUT(ApisEndPoints.uploadPhoto)
  // @MultiPart()
  // Future<String> uploadPhotos(
  //   @Header("Authorization") String token,
  //   @Part(name: "photo") MultipartFile files,
  // );

  @PATCH(ApisEndPoints.changePassword)
  Future<ResetPasswordResponseModel> resetPassword(@Header("Authorization") String token, @Body() ResetPasswordRequestModel requestBody);

}
