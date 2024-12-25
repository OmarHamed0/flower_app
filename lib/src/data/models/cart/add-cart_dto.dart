import 'package:flower_app/src/domain/entities/cart/cart_entity.dart';

import '../../api/core/response_model/cart/add_cart_response/add_cart_response_model.dart';


class AddCartDto {
  String? message;
  AddCartDto({this.message});


  static CartEntity toDomain({required AddCartResponseModel addCartResponseModel}){
    return  CartEntity(
      numOfCartItems: 0    ,
      totalPrice: addCartResponseModel.cart?.totalPrice,
      //cartList: []
    );
  }
}