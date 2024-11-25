import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/domain/entities/product_entity/product_entity.dart';

abstract interface class ProductRepo{
  Future<ApiResult<ProductEntity>> getProductById(String id);
  Future<ApiResult<List<ProductEntity>>> getProduct({required Map<String,dynamic>?query});
  Future<ApiResult<List<ProductEntity>>> getProductBesetSeller({required Map<String,dynamic>?query});
}