

import 'package:flower_app/common/api_execute.dart';
import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/data/data_sources/offline_data_source/offline_data_source.dart';
import 'package:flower_app/src/data/data_sources/online_data_source/orders/orders_online_data_source.dart';
import 'package:flower_app/src/data/models/orders/orders_dto.dart';
import 'package:flower_app/src/domain/entities/orders_entity.dart';
import 'package:flower_app/src/domain/repositories/orders/user_orders_repo.dart';
import 'package:injectable/injectable.dart';



@Injectable(as: UserOrdersRepo)
class UserOrdersRepoImpl implements UserOrdersRepo {
  final OrdersOnlineDataSource _ordersOnlineDataSource;
  final AuthOfflineDataSource _authOfflineDataSource;
  UserOrdersRepoImpl(this._ordersOnlineDataSource, this._authOfflineDataSource);
  @override
  Future<ApiResult<OrdersEntity>> getUserOrders() async{
    String? token = await _authOfflineDataSource.getToken()??'';
    return await executeApi<OrdersEntity>(apiCall: () async{
      var response = await _ordersOnlineDataSource.getUserOrders("Bearer $token");
       return OrdersDto().toDomain(response);
    });
  }



}