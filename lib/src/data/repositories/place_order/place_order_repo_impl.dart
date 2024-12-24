
import 'package:flower_app/common/api_execute.dart';
import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/data/api/core/requestes_models/checkout_place_order_request_model/place_order_request_model.dart';
import 'package:flower_app/src/data/data_sources/offline_data_source/offline_data_source.dart';
import 'package:flower_app/src/data/data_sources/online_data_source/place_order/place_order_online_data_source.dart';
import 'package:flower_app/src/data/models/place_order/PlaceOrderDto.dart';
import 'package:flower_app/src/domain/entities/place_order/PlaceOrderEntity.dart';
import 'package:flower_app/src/domain/entities/place_order/shipping_address_entity.dart';
import 'package:flower_app/src/domain/repositories/place_order/PlaceOrderRepo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PlaceOrderRepo)
 class PlaceOrderRepoImpl implements PlaceOrderRepo{
  final PlaceOrderOnlineDataSource _placeOrderOnlineDataSource;
  final AuthOfflineDataSource _authOfflineDataSource;

  PlaceOrderRepoImpl(this._placeOrderOnlineDataSource, this._authOfflineDataSource);

  @override
  Future<ApiResult<PlaceOrderEntity>> placeOrder(ShippingAddressEntity shippingAddressEntity) async{
       var token = await _authOfflineDataSource.getToken();
       PlaceOrderRequestModel placeOrderRequestModel =  _getPlaceOrderRequestModel(shippingAddressEntity);
       var result =  await executeApi<PlaceOrderEntity>(apiCall:<PlaceOrderEntity> ()async{
           var response = await _placeOrderOnlineDataSource.placeOrder(token!, placeOrderRequestModel);
           return PlaceOrderDto().toDomain(response);
       });
       return result;
  }

  PlaceOrderRequestModel _getPlaceOrderRequestModel(ShippingAddressEntity shippingAddressEntity){
     PlaceOrderRequestModel placeOrderRequestModel = PlaceOrderRequestModel(
      shippingAddress: ShippingAddress(
         city:  shippingAddressEntity.city,
          street: shippingAddressEntity.street,
          phone: shippingAddressEntity.phone
      )
    );
    return placeOrderRequestModel;
  }

}