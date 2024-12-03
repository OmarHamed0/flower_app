import '../../../domain/entities/cart/cart_entity.dart';
import '../../../domain/entities/cart/cart_product_entity.dart';
import '../../api/core/response_model/cart/get_all_cart_response/get_all_cart_response_mode.dart';

class GetLoggedUserCartDto{
  String? message;
  GetLoggedUserCartDto({this.message});


   CartEntity toDomain({required GetAllCartResponseModel getLoggedUsrCart}){
    return  CartEntity(
        numOfCartItems: getLoggedUsrCart.numOfCartItems,
        totalPrice: getLoggedUsrCart.cart?.totalPrice,
        cartList: _toCartItemList(getLoggedUsrCart.cart),
    );
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
      id: cartItems.product?.id,
      title: cartItems.product?.title,
      description: cartItems.product?.description,
      imgCover: cartItems.product?.imgCover,
      priceAfterDiscount: cartItems.product?.priceAfterDiscount,
      price: cartItems.price,
      counterQuantity: cartItems.quantity,
      quantity: cartItems.product?.quantity,
    );
  }
}