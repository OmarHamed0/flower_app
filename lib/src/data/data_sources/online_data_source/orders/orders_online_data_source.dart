import 'package:flower_app/src/data/api/core/response_model/orders/user_orders_response_model.dart';

abstract interface class OrdersOnlineDataSource {
  Future<UserOrderResponseModel> getUserOrders(String token);
}