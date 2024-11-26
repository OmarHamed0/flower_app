import 'package:flower_app/src/data/api/core/response_model/get_catigories/get_catigories_resonse_model.dart';
import 'package:flower_app/src/domain/entities/category_entity/category_entity.dart';

class CategoryModelDto {
  String? id;
  String? name;
  String? slug;

  CategoryModelDto({
    this.id,
    this.name,
    this.slug,
  });

  List<CategoryEntity> toDomain(GetCatigoriesResponseModel response) {
    return response.categories!
        .map(
          (e) => CategoryEntity(
            id: e.Id,
            name: e.name,
            slug: e.slug,
          ),
        ).toList();
  }
}
