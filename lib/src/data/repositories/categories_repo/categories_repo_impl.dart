
import 'package:flower_app/common/api_execute.dart';
import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/data/data_sources/online_data_source/catigories_online_data_source/catigories_data_source.dart';
import 'package:flower_app/src/domain/entities/category_entity/category_entity.dart';
import 'package:flower_app/src/domain/repositories/categories_repo/categories_repo.dart';
import 'package:injectable/injectable.dart';

import '../../models/category_model_dto/category_model_dto.dart';

@Injectable(as: CategoriesRepo)
class CategoriesRepoImpl implements CategoriesRepo {
  final CategoriesOnlineDataSource categoriesDataSource;

  CategoriesRepoImpl(this.categoriesDataSource);

  @override
  Future<ApiResult<List<CategoryEntity>>> getCategories() async{
    return await executeApi<List<CategoryEntity>>(
      apiCall: () async {
        var categories = await categoriesDataSource.getCategories();
        return CategoryModelDto().toDomain(categories);
      },
    );
  }
  }