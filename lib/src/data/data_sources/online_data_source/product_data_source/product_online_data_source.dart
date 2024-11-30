import 'package:flower_app/src/data/api/core/response_model/product_response_models/one_product_response_model.dart';

import '../../../api/core/response_model/beset_seller/beset_seller_model.dart';
import '../../../api/core/response_model/product/product_response_model.dart';

abstract interface class ProductOnlineDataSource{
  Future<OneProductResponseModel> getProductById(String id);
  Future<ProductResponseModel> getProduct({required Map<String ,dynamic>? query});
  Future<BesetSellerModel> getProductBesetSeller({required Map<String ,dynamic>? query});
}