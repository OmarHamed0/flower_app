import 'package:flower_app/src/data/api/core/requestes_models/checkout_place_order_request_model/place_order_request_model.dart';
import 'package:flower_app/src/data/api/core/response_model/checkout_place_order/place_order_response_model.dart';

abstract interface class PlaceOrderOnlineDataSource {
  Future<PlaceOrderResponseModel> placeOrder(
      String token,
      PlaceOrderRequestModel placeOrderRequestModel);
}
