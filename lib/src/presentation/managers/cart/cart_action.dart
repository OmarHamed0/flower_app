import '../../../domain/entities/cart/cart_product_entity.dart';

sealed class CartAction {}

class AddCartAction extends CartAction {
  String productId;
  int quantity;
  AddCartAction({required this.productId, this.quantity = 1});
}

class GetLoggedUserCartAction extends CartAction {}

class RemoveSpecificCartItemAction extends CartAction {
  final CartProductEntity cartProductEntity;

  RemoveSpecificCartItemAction({required this.cartProductEntity});
}
class IncrementQuantityCartItemAction extends CartAction{
  final  CartProductEntity cartProductEntity  ;
  IncrementQuantityCartItemAction({required this.cartProductEntity,});
}
class DecrementQuantityCartItemAction extends CartAction{
  final  CartProductEntity cartProductEntity  ;
  DecrementQuantityCartItemAction({required this.cartProductEntity});
}
