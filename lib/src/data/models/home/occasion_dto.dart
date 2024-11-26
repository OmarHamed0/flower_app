import 'package:flower_app/src/domain/entities/home/occasion_model.dart';

class OccasionsDto {
  OccasionsDto({
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

  OccasionsDto.fromJson(dynamic json) {
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

  OccasionsModel toModel(OccasionsDto dto) {
    return OccasionsModel(
      id: dto.id,
      name: dto.name,
      slug: dto.slug,
      image: dto.image,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }
}
