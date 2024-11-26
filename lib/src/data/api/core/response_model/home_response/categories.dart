import 'package:flower_app/src/domain/entities/home/category_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'categories.g.dart';

@JsonSerializable()
class Categories {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "slug")
  final String? slug;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;

  Categories({
    this.Id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    return _$CategoriesFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CategoriesToJson(this);
  }

  CategoryModel toEntity() {
    return CategoryModel(
      id: Id,
      name: name,
      slug: slug,
      image: image,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
