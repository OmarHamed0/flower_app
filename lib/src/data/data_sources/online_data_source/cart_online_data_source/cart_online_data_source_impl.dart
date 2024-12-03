import 'package:flower_app/src/data/api/api_services.dart';
import 'package:flower_app/src/data/api/core/requestes_models/cart/add_cart_request.dart';
import 'package:flower_app/src/data/api/core/requestes_models/cart/cart_quantity_request.dart';
import 'package:flower_app/src/data/api/core/response_model/cart/get_all_cart_response/get_all_cart_response_mode.dart';
import 'package:flower_app/src/data/api/core/response_model/cart/remove_cart_response/remove_cart_respone_model.dart';
import 'package:flower_app/src/data/data_sources/online_data_source/cart_online_data_source/cart_online_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../api/core/response_model/cart/add_cart_response_model/add_cart_response_model.dart';

@Injectable(as:CartOnlineDataSource )
class CartOnlineDataSourceImpl  implements CartOnlineDataSource {
  final   ApiServices _apiServices;
  CartOnlineDataSourceImpl(this._apiServices);
  @override
  Future<AddCartResponseModel> addCart({required String token, required AddCartRequest addCartRequest}) async{
   var addCartResponseModel=await _apiServices.addProductCart(token: token, addCartProductRequest: addCartRequest);
   return addCartResponseModel;
  }

  @override
  Future<GetAllCartResponseModel> getLoggedUserCart({required String token})async {
    var getAllCartResponseModel=await _apiServices.getLoggedUserCart(token: token);
    return getAllCartResponseModel;
  }

  @override
  Future<RemoveCartResponseModel> removeSpecificCartItem({required String token, required String id}) async{
    var removeCartResponseModel=await _apiServices.removeSpecificCartItem(token: token, id: id);
    return removeCartResponseModel;
  }

  @override
  Future<GetAllCartResponseModel> updateQuantityCart({required String token, required CartQuantityRequest cartQuantityRequest, required String id}) async{
    var getAllCartResponseModel=await _apiServices.updateQuantity(token: token, id: id, cartQuantityRequest: cartQuantityRequest);
    return getAllCartResponseModel;
  }
}