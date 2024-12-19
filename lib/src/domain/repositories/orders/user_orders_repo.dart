import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/domain/entities/orders_entity.dart';

abstract interface class UserOrdersRepo{
  Future<ApiResult<OrdersEntity>> getUserOrders();
}