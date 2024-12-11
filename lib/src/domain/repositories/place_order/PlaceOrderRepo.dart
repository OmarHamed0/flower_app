import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/domain/entities/place_order/PlaceOrderEntity.dart';
import 'package:flower_app/src/domain/entities/place_order/shipping_address_entity.dart';

abstract interface class PlaceOrderRepo {
  Future<ApiResult<PlaceOrderEntity>> placeOrder(
      ShippingAddressEntity shippingAddressEntity);
}
