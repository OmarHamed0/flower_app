import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/domain/entities/checkout/cash_checkout_entity.dart';
import 'package:flower_app/src/domain/entities/checkout/credit_checkout_entity.dart';
import 'package:flower_app/src/domain/entities/checkout/place_order_request_entity.dart';

abstract interface class CheckoutRepo {
  Future<ApiResult<CashCheckoutEntity>> cashCheckout(PlaceOrderRequestEntity placeOrderRequestEntity);
  Future<ApiResult<CreditCheckoutEntity>> creditCheckout(PlaceOrderRequestEntity placeOrderRequestEntity);
}