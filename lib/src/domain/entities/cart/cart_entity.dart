
import 'cart_product_entity.dart';

class CartEntity {
  int? numOfCartItems;
  List<CartProductEntity>? cartList;
  num? totalPrice;

  CartEntity({
    this.numOfCartItems,
    this.cartList,
    this.totalPrice,
  });
}
