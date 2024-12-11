
import 'package:flower_app/src/data/api/api_services.dart';
import 'package:flower_app/src/data/api/core/requestes_models/checkout_place_order_request_model/place_order_request_model.dart';
import 'package:flower_app/src/data/api/core/response_model/checkout_place_order/place_order_response_model.dart';
import 'package:flower_app/src/data/data_sources/online_data_source/place_order/place_order_online_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PlaceOrderOnlineDataSource)
class PlaceOrderOnlineDataSourceImpl implements PlaceOrderOnlineDataSource{

  final ApiServices _apiServices;
  PlaceOrderOnlineDataSourceImpl(this._apiServices);
  @override
  Future<PlaceOrderResponseModel> placeOrder(String token,PlaceOrderRequestModel placeOrderRequestModel) async{
    return await _apiServices.placeOrder(token, placeOrderRequestModel);
  }

}