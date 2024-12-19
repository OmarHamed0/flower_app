import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/domain/entities/orders_entity.dart';
import 'package:injectable/injectable.dart';

import '../../repositories/orders/user_orders_repo.dart';

@injectable
class OrdersUseCase {
  final UserOrdersRepo _userOrdersRepo;

  OrdersUseCase(this._userOrdersRepo);

  Future<ApiResult<OrdersEntity>> getUserOrders() async {
    return await _userOrdersRepo.getUserOrders();
  }
}
