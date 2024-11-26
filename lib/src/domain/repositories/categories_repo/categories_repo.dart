import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/domain/entities/category_entity/category_entity.dart';

abstract interface class CategoriesRepo{
  Future<ApiResult<List<CategoryEntity>>> getCategories();
}