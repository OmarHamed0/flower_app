import 'package:json_annotation/json_annotation.dart';

part 'occasion_response_model.g.dart';

@JsonSerializable()
class OccasionResponseModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final Metadata? metadata;
  @JsonKey(name: "occasions")
  final List<Occasions>? occasions;

  OccasionResponseModel ({
    this.message,
    this.metadata,
    this.occasions,
  });

  factory OccasionResponseModel.fromJson(Map<String, dynamic> json) {
    return _$OccasionResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OccasionResponseModelToJson(this);
  }
}

@JsonSerializable()
class Metadata {
  @JsonKey(name: "currentPage")
  final int? currentPage;
  @JsonKey(name: "numberOfPages")
  final int? numberOfPages;
  @JsonKey(name: "limit")
  final int? limit;

  Metadata ({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return _$MetadataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MetadataToJson(this);
  }
}

@JsonSerializable()
class Occasions {
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

  Occasions ({
    this.Id,
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
}


