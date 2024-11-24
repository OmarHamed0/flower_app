import 'package:flower_app/src/data/api/core/response_model/product_response_models/one_product_response_model.dart';

abstract interface class ProductOnlineDataSource{
  Future<OneProductResponseModel> getProductById(String id);
}