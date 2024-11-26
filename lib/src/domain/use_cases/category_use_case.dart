
import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/domain/entities/category_entity/category_entity.dart';
import 'package:flower_app/src/domain/repositories/categories_repo/categories_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoryUseCase{
  final CategoriesRepo _categoriesRepo;
  CategoryUseCase(this._categoriesRepo);

  Future<ApiResult<List<CategoryEntity>>> getCategory() async {
    return await _categoriesRepo.getCategories();
  }
}