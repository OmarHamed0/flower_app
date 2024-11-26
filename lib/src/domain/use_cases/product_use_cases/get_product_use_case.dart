import 'package:injectable/injectable.dart';

import '../../../../common/api_result.dart';
import '../../../presentation/managers/product/core/product_core.dart';
import '../../entities/product_entity/product_entity.dart';
import '../../repositories/product_repo/product_repo.dart';

@injectable
class GetProductUseCase {
  final ProductRepo _productRepo;
  GetProductUseCase(this._productRepo);
  Future<ApiResult<List<ProductEntity>>> invoke({
    required ProductEndPoints endpoint,
    ProductQuery? productQuery,
    String? productId,
  }) {
    return GetProductFactory.getProduct(
        productRepository: _productRepo,
        endpoint: endpoint,
        productId: productId,
        productQuery: productQuery);
  }
}

class GetProductFactory {
  static Future<ApiResult<List<ProductEntity>>> getProduct({
    required ProductRepo productRepository,
    required ProductEndPoints endpoint,
    ProductQuery? productQuery,
    String? productId,
  }) {
    final queries = ProductQueryFactory.getProductQueryParams(productQuery);
    switch (endpoint) {
      case ProductEndPoints.products:
        return productRepository.getProduct(
          query: queries.getQueryParameters(productId),
        );
      case ProductEndPoints.besetSeller:
        return productRepository.getProductBesetSeller(
          query: queries.getQueryParameters(productId),
        );
    }
  }
}


