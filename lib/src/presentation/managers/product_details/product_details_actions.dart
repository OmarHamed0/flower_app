sealed class ProductDetailsActions{}

class GetProductByIdAction extends ProductDetailsActions{
  String? productId;
  GetProductByIdAction(this.productId);
}