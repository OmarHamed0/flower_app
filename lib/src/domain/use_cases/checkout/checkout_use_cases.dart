

import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/domain/entities/checkout/cash_checkout_entity.dart';
import 'package:flower_app/src/domain/entities/checkout/credit_checkout_entity.dart';
import 'package:flower_app/src/domain/entities/checkout/place_order_request_entity.dart';
import 'package:flower_app/src/domain/repositories/checkout/checkout_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckoutUseCase{
  final CheckoutRepo _checkoutRepo;
  CheckoutUseCase(this._checkoutRepo);
  Future<ApiResult<CashCheckoutEntity>> cashCheckout(PlaceOrderRequestEntity placeOrderRequestEntity)async{
    return await _checkoutRepo.cashCheckout(placeOrderRequestEntity);
  }

  Future<ApiResult<CreditCheckoutEntity>> creditCheckout(PlaceOrderRequestEntity placeOrderRequestEntity)async {
    return await _checkoutRepo.creditCheckout(placeOrderRequestEntity);
  }

}