import 'package:flower_app/src/data/api/core/requestes_models/checkout_place_order_request_model/place_order_request_model.dart';
import 'package:flower_app/src/data/api/core/response_model/checkout/cash_checkout_response_model.dart';
import 'package:flower_app/src/data/api/core/response_model/checkout/credit_checkout_response_model.dart';

abstract interface class CheckoutOnlineDataSource{
  Future<CashCheckoutResponseModel> cashCheckout(String token, PlaceOrderRequestModel placeOrderRequestModel);
  Future<CreditCheckoutResponseModel> creditCheckout(String token, PlaceOrderRequestModel placeOrderRequestModel,String localHost);
}