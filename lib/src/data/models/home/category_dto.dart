import 'package:flower_app/src/domain/entities/home/category_model.dart';

class CategoriesDto {
  CategoriesDto({
    String? id,
    String? name,
    String? slug,
    String? image,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _name = name;
    _slug = slug;
    _image = image;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  CategoriesDto.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _slug = json['slug'];
    _image = json['image'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  String? _id;
  String? _name;
  String? _slug;
  String? _image;
  String? _createdAt;
  String? _updatedAt;

  String? get id => _id;
  String? get name => _name;
  String? get slug => _slug;
  String? get image => _image;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    map['image'] = _image;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

  CategoryModel toModel() {
    return CategoryModel(
      id: _id,
      name: _name,
      slug: _slug,
      image: _image,
      createdAt: _createdAt,
      updatedAt: _updatedAt,
    );
  }
}
