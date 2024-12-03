import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/data/api/core/requestes_models/cart/add_cart_request.dart';
import 'package:flower_app/src/data/api/core/requestes_models/cart/cart_quantity_request.dart';
import 'package:flower_app/src/data/data_sources/offline_data_source/cart/cart_offline_data_source.dart';
import 'package:flower_app/src/data/data_sources/online_data_source/cart_online_data_source/cart_online_data_source.dart';
import 'package:flower_app/src/data/models/cart/add-cart_dto.dart';
import 'package:flower_app/src/data/models/cart/remove-cart_dto.dart';
import 'package:flower_app/src/domain/entities/cart/cart_entity.dart';
import 'package:flower_app/src/domain/repositories/cart_repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/api_execute.dart';
import '../../models/cart/get_logged_user_cart_dto.dart';

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

  @override
  Future<ApiResult<CartEntity>> getLoggedUserCart() {
    return executeApi(
      apiCall: () async {
        var token = await cartOfflineDataSource.getToken();
        var getLoggedUserCartResponseModel =
            await cartOnlineDataSource.getLoggedUserCart(token: token);
        return GetLoggedUserCartDto()
            .toDomain(getLoggedUsrCart: getLoggedUserCartResponseModel);
      },
    );
  }

  @override
  Future<ApiResult<CartEntity>> removeSpecificCartItem({required String id}) {
    return executeApi(
      apiCall: () async {
        var token = await cartOfflineDataSource.getToken();
        var removeCartResponseModel = await cartOnlineDataSource
            .removeSpecificCartItem(token: token, id: id);
        return RemoveCartDto()
            .toDomain(removeCartResponseModel: removeCartResponseModel);
      },
    );
  }

  @override
  Future<ApiResult<CartEntity>> updateQuantityCart(
      {required CartQuantityRequest cartQuantityRequest,
      required String id}) async {
    return await executeApi<CartEntity>(
      apiCall: () async {
        var token = await cartOfflineDataSource.getToken();
        var getLoggedUserCartResponseModel =
            await cartOnlineDataSource.updateQuantityCart(
                token: token, cartQuantityRequest: cartQuantityRequest, id: id);
        return GetLoggedUserCartDto()
            .toDomain(getLoggedUsrCart: getLoggedUserCartResponseModel);
      },
    );
  }
}
