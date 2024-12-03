import 'package:flower_app/src/data/api/core/response_model/cart/add_cart_response_model/add_cart_response_model.dart';
import 'package:flower_app/src/domain/entities/cart/cart_entity.dart';

class AddCartDto {
  String? message;
  AddCartDto({this.message});


  static CartEntity toDomain({required AddCartResponseModel addCartResponseModel}){
    return  CartEntity(
      numOfCartItems: addCartResponseModel.numOfCartItems,
      totalPrice: addCartResponseModel.cart?.totalPrice,
      cartList: []
    );
  }
}