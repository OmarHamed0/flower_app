import 'package:flower_app/src/data/api/core/requestes_models/cart/add_cart_request.dart';
import 'package:flower_app/src/domain/entities/cart/cart_entity.dart';

import '../../../../common/api_result.dart';

abstract class CartRepo{
  Future<ApiResult<CartEntity>>addCart({required AddCartRequest addCartRequest});
}