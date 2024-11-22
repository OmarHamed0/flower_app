import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/domain/entities/product_entity/product_entity.dart';
import 'package:flower_app/src/domain/repositories/product_repo/product_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRepo)
class ProductRepoImpl implements ProductRepo{
  @override
  Future<ApiResult<ProductEntity>> getProductById(String id) {
    // TODO: implement getProductById
    throw UnimplementedError();
  }
}