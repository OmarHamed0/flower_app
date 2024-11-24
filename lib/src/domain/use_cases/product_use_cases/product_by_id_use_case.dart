import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/domain/entities/product_entity/product_entity.dart';
import 'package:flower_app/src/domain/repositories/product_repo/product_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductByIdUseCase{
  ProductRepo _productRepo;
  ProductByIdUseCase(this._productRepo);
  Future<ApiResult<ProductEntity>> getProductById(String id) async{
    return await _productRepo.getProductById(id);
  }
}