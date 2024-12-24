
import 'core/product_core.dart';

sealed class ProductEvent{}
class GetProductEvent extends ProductEvent{
  final ProductQueryParameters productQueryParameters;
  GetProductEvent({required this.productQueryParameters});
}



class ProductQueryParameters{
  String ? productId;
  ProductQuery ? productQuery;
  final ProductEndPoints productEndPoints;
  ProductQueryParameters({ this.productId,  this.productQuery, required this.productEndPoints});
}