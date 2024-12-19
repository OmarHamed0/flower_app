import 'package:dio/dio.dart';
import 'package:flower_app/src/data/api/core/requestes_models/add_address_request.dart';
import 'package:flower_app/src/data/api/core/requestes_models/reset_password_request_model.dart';
import 'package:flower_app/src/data/api/core/response_model/address/address_response.dart';
import 'package:flower_app/src/data/api/core/response_model/auth_response_models/reset_password_response_model.dart';
import 'package:flower_app/src/data/api/core/response_model/cart/add_cart_response_model/add_cart_response_model.dart';
import 'package:flower_app/src/data/api/core/response_model/cart/get_all_cart_response/get_all_cart_response_mode.dart';
import 'package:flower_app/src/data/api/core/response_model/checkout_place_order/place_order_response_model.dart';
import 'package:flower_app/src/data/api/core/response_model/orders/user_orders_response_model.dart';
import 'package:flower_app/src/data/api/core/response_model/product_response_models/one_product_response_model.dart';
import 'package:flower_app/src/data/models/auth/signup/request/sign_up_user_body.dart';
import 'package:flower_app/src/data/models/auth/signup/response/sign_up_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import 'core/constants/apis_baseurl.dart';
import 'core/constants/apis_end_points.dart';
import 'core/requestes_models/cart/add_cart_request.dart';
import 'core/requestes_models/cart/cart_quantity_request.dart';
import 'core/requestes_models/checkout_place_order_request_model/place_order_request_model.dart';
import 'core/requestes_models/edit_profile_request.dart';
import 'core/requestes_models/signin_request_body.dart';
import 'core/response_model/auth_response_models/logged_user_data_reponse_model.dart';
import 'core/response_model/auth_response_models/signin_response_model.dart';
import 'core/response_model/beset_seller/beset_seller_model.dart';
import 'core/response_model/cart/remove_cart_response/remove_cart_respone_model.dart';
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
  Future<ResetPasswordResponseModel> resetPassword(
      @Header("Authorization") String token,
      @Body() ResetPasswordRequestModel requestBody);

  @POST(ApisEndPoints.cart)
  Future<AddCartResponseModel> addProductCart({
    @Header("Authorization") required String token,
    @Body() required AddCartRequest addCartProductRequest,
  });

  @GET(ApisEndPoints.cart)
  Future<GetAllCartResponseModel> getLoggedUserCart(
      {@Header("Authorization") required String token});

  @DELETE("${ApisEndPoints.cart}/{id}")
  Future<RemoveCartResponseModel> removeSpecificCartItem(
      {@Header("Authorization") required String token,
      @Path("id") required String id});

  @PUT("${ApisEndPoints.cart}/{id}")
  Future<GetAllCartResponseModel> updateQuantity({
    @Header("Authorization") required String token,
    @Path("id") required String id,
    @Body() required CartQuantityRequest cartQuantityRequest,
  });

  @GET(ApisEndPoints.savedAddresses)
  Future<AddressResponse> getSavedAddresses(
      @Header("Authorization") String token);

  @DELETE("${ApisEndPoints.deleteAddress}/{id}")
  Future<AddressResponse> deleteAddress(
      @Header("Authorization") String token, @Path("id") String id);

  @PATCH(ApisEndPoints.addNewAddress)
  Future<AddressResponse> addNewAddress(
      @Header("Authorization") String token, @Body() AddAddressRequest address);

  @POST(ApisEndPoints.orders)
  Future<PlaceOrderResponseModel> placeOrder(
      @Header("Authorization") String token,
      @Body() PlaceOrderRequestModel body);

  @GET(ApisEndPoints.orders)
  Future<UserOrderResponseModel> getUserOrders(
      @Header("Authorization") String token);
}
