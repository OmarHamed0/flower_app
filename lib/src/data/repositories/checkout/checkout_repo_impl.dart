import 'package:flower_app/common/api_execute.dart';
import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/data/api/core/requestes_models/checkout_place_order_request_model/place_order_request_model.dart';
import 'package:flower_app/src/data/data_sources/offline_data_source/offline_data_source.dart';
import 'package:flower_app/src/data/data_sources/online_data_source/checkout/checkout_online_data_source.dart';
import 'package:flower_app/src/domain/entities/checkout/cash_checkout_entity.dart';
import 'package:flower_app/src/domain/entities/checkout/credit_checkout_entity.dart';
import 'package:flower_app/src/domain/entities/checkout/place_order_request_entity.dart';
import 'package:flower_app/src/domain/repositories/checkout/checkout_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CheckoutRepo)
class CheckoutRepoImpl implements CheckoutRepo {
  final AuthOfflineDataSource _authOfflineDataSource;
  final CheckoutOnlineDataSource _checkoutOnlineDataSource;

  CheckoutRepoImpl(this._checkoutOnlineDataSource, this._authOfflineDataSource);

  @override
  Future<ApiResult<CashCheckoutEntity>> cashCheckout(
      PlaceOrderRequestEntity placeOrderRequestEntity) async {
    String token = await _getToken();
    PlaceOrderRequestModel placeOrderRequestModel =
        placeOrderRequestEntity.toData();
    return await executeApi<CashCheckoutEntity>(apiCall: () async {
      var response = await _checkoutOnlineDataSource.cashCheckout(
          token, placeOrderRequestModel);
      return response.toDomainDto();
    });
  }

  Future<String> _getToken() async {
    String token = await _authOfflineDataSource.getToken() ?? "";
    return "Bearer $token";
  }

  @override
  Future<ApiResult<CreditCheckoutEntity>> creditCheckout(
      PlaceOrderRequestEntity placeOrderRequestEntity) async {
    String token = await _getToken();
    String localHost = "http://localhost:3000";
    PlaceOrderRequestModel placeOrderRequestModel =
        placeOrderRequestEntity.toData();
    return await executeApi<CreditCheckoutEntity>(apiCall: () async {
      var response = await _checkoutOnlineDataSource.creditCheckout(
          token, placeOrderRequestModel, localHost);
      return response.toDomainDto();
    });
  }
}
