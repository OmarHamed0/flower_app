
import 'package:flower_app/src/data/api/api_services.dart';
import 'package:flower_app/src/data/api/core/response_model/orders/user_orders_response_model.dart';
import 'package:flower_app/src/data/data_sources/online_data_source/orders/orders_online_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OrdersOnlineDataSource)
class OrdersOnlineDataSourceImpl implements OrdersOnlineDataSource{
  final ApiServices _apiServices;
  OrdersOnlineDataSourceImpl(this._apiServices);
  @override
  Future<UserOrderResponseModel> getUserOrders(String token) async{
      return _apiServices.getUserOrders(token);
  }
}