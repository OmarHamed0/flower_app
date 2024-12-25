

import 'package:flower_app/src/data/api/api_services.dart';
import 'package:flower_app/src/data/api/core/requestes_models/checkout_place_order_request_model/place_order_request_model.dart';
import 'package:flower_app/src/data/api/core/response_model/checkout/cash_checkout_response_model.dart';
import 'package:flower_app/src/data/api/core/response_model/checkout/credit_checkout_response_model.dart';
import 'package:flower_app/src/data/data_sources/online_data_source/checkout/checkout_online_data_source.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: CheckoutOnlineDataSource)
class CheckoutOnlineDataSourceImpl implements CheckoutOnlineDataSource{
  final ApiServices _apiServices;
  CheckoutOnlineDataSourceImpl(this._apiServices);
  @override
  Future<CashCheckoutResponseModel> cashCheckout(String token, PlaceOrderRequestModel placeOrderRequestModel)async {
     return await _apiServices.cashCheckout(token, placeOrderRequestModel);
  }

  @override
  Future<CreditCheckoutResponseModel> creditCheckout(String token, PlaceOrderRequestModel placeOrderRequestModel,String localHost)async {
     return await _apiServices.creditCheckout(token, placeOrderRequestModel,localHost);
  }

}