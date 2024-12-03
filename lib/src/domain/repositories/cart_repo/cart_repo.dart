import 'package:flower_app/src/data/api/core/requestes_models/cart/add_cart_request.dart';
import 'package:flower_app/src/domain/entities/cart/cart_entity.dart';

import '../../../../common/api_result.dart';
import '../../../data/api/core/requestes_models/cart/cart_quantity_request.dart';

abstract class CartRepo{
  Future<ApiResult<CartEntity>>addCart({required AddCartRequest addCartRequest});
  Future<ApiResult<CartEntity>>getLoggedUserCart();
  Future<ApiResult<CartEntity>> removeSpecificCartItem({required String id});
  Future<ApiResult<CartEntity>> updateQuantityCart(
      {required CartQuantityRequest cartQuantityRequest, required String id});

}