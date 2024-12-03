import 'package:flower_app/src/data/api/core/requestes_models/cart/add_cart_request.dart';

import '../../../api/core/response_model/cart/add_cart_response_model/add_cart_response_model.dart';

abstract  class CartOnlineDataSource {
  Future<AddCartResponseModel>addCart({required String token  ,required AddCartRequest addCartRequest});
}