import 'package:flower_app/src/data/api/core/requestes_models/cart/add_cart_request.dart';
import 'package:flower_app/src/data/api/core/requestes_models/cart/cart_quantity_request.dart';
import 'package:flower_app/src/data/api/core/response_model/cart/get_all_cart_response/get_all_cart_response_mode.dart';
import 'package:flower_app/src/data/api/core/response_model/cart/remove_cart_response/remove_cart_respone_model.dart';

import '../../../api/core/response_model/cart/add_cart_response_model/add_cart_response_model.dart';

abstract  class CartOnlineDataSource {
  Future<AddCartResponseModel>addCart({required String token  ,required AddCartRequest addCartRequest});
  Future<GetAllCartResponseModel>getLoggedUserCart({required String token});
  Future<RemoveCartResponseModel>removeSpecificCartItem({required String token, required String id});
  Future<GetAllCartResponseModel>updateQuantityCart({
    required String token,
    required CartQuantityRequest cartQuantityRequest,
    required String id
  });
}