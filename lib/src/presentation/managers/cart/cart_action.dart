sealed class CartAction {}

class AddCartAction extends CartAction {
  String productId;
  int quantity;
  AddCartAction({required this.productId, this.quantity = 1});
}
