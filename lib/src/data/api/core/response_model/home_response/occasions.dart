import 'package:flower_app/src/domain/entities/home/occasion_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'occasions.g.dart';

@JsonSerializable()
class Occasions {
  @JsonKey(name: "_id")
  final String? id;
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

  Occasions({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory Occasions.fromJson(Map<String, dynamic> json) {
    return _$OccasionsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OccasionsToJson(this);
  }

  OccasionsModel toEntity() {
    return OccasionsModel(
      id: id,
      name: name,
      slug: slug,
      image: image,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
