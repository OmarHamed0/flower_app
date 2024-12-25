import 'package:flower_app/src/domain/entities/cart/cart_entity.dart';
import '../../../domain/entities/cart/cart_product_entity.dart';
import '../../api/core/response_model/cart/get_all_cart_response/get_all_cart_response_mode.dart';

class RemoveCartDto {
  String? message;
  RemoveCartDto({this.message});

  CartEntity toDomain(
      {required GetAllCartResponseModel removeCartResponseModel}) {
    return CartEntity(
        numOfCartItems: removeCartResponseModel.numOfCartItems,
        totalPrice: removeCartResponseModel.cart?.totalPrice,
        cartList: _toCartItemList(removeCartResponseModel.cart));
  }

  List<CartProductEntity> _toCartItemList(Cart? carts) {
    if (carts?.cartItems == null) {
      return [];
    } else {
      List<CartProductEntity> cartItems = carts!.cartItems!
          .map(
            (e) => _cartProductEntity(e),
          )
          .toList();

      return cartItems;
    }
  }

  CartProductEntity _cartProductEntity(CartItems cartItems) {
    return CartProductEntity(
      id: cartItems.Id,
      price: cartItems.price,
      quantity: cartItems.quantity,
    );
  }
}
