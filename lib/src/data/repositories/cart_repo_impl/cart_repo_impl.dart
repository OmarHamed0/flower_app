import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/data/api/core/requestes_models/cart/add_cart_request.dart';
import 'package:flower_app/src/data/data_sources/offline_data_source/cart/cart_offline_data_source.dart';
import 'package:flower_app/src/data/data_sources/online_data_source/cart_online_data_source/cart_online_data_source.dart';
import 'package:flower_app/src/data/models/cart/add-cart_dto.dart';
import 'package:flower_app/src/domain/entities/cart/cart_entity.dart';
import 'package:flower_app/src/domain/repositories/cart_repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/api_execute.dart';
@Injectable(as: CartRepo)
class CartRepoImpl implements CartRepo {
  final CartOnlineDataSource cartOnlineDataSource;
  final CartOfflineDataSource cartOfflineDataSource;
  CartRepoImpl(
      {required this.cartOnlineDataSource,
      required this.cartOfflineDataSource});
  @override
  Future<ApiResult<CartEntity>> addCart(
      {required AddCartRequest addCartRequest}) async {
    return executeApi(
      apiCall: () async {
        var token = await cartOfflineDataSource.getToken();
        var addCartResponseModel = await cartOnlineDataSource.addCart(
            token: token, addCartRequest: addCartRequest);
        return AddCartDto.toDomain(addCartResponseModel: addCartResponseModel);
      },
    );
  }
}
