import 'package:flower_app/common/api_execute.dart';
import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/data/data_sources/online_data_source/product_data_source/product_online_data_source.dart';
import 'package:flower_app/src/data/models/product_model_dto/product_model_dto.dart';
import 'package:flower_app/src/domain/entities/product_entity/product_entity.dart';
import 'package:flower_app/src/domain/repositories/product_repo/product_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRepo)
class ProductRepoImpl implements ProductRepo{
  final ProductOnlineDataSource _productOnlineDataSource;
  ProductRepoImpl(this._productOnlineDataSource);
  @override
  Future<ApiResult<ProductEntity>> getProductById(String id) async{
     return await executeApi(apiCall: () async{
        var response = await _productOnlineDataSource.getProductById(id);
        return ProductModelDto().toDomain(response);
     });
  }
}