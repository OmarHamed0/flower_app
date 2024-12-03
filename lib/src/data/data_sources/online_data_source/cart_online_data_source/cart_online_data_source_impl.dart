import 'package:flower_app/src/data/api/api_services.dart';
import 'package:flower_app/src/data/api/core/requestes_models/cart/add_cart_request.dart';
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
}