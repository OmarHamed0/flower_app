// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'occasion_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OccasionResponseModel _$OccasionResponseModelFromJson(
        Map<String, dynamic> json) =>
    OccasionResponseModel(
      message: json['message'] as String?,
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      occasions: (json['occasions'] as List<dynamic>?)
          ?.map((e) => Occasions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OccasionResponseModelToJson(
        OccasionResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'metadata': instance.metadata,
      'occasions': instance.occasions,
    };

Metadata _$MetadataFromJson(Map<String, dynamic> json) => Metadata(
      currentPage: (json['currentPage'] as num?)?.toInt(),
      numberOfPages: (json['numberOfPages'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MetadataToJson(Metadata instance) => <String, dynamic>{
      'currentPage': instance.currentPage,
      'numberOfPages': instance.numberOfPages,
      'limit': instance.limit,
    };

Occasions _$OccasionsFromJson(Map<String, dynamic> json) => Occasions(
      Id: json['_id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      image: json['image'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$OccasionsToJson(Occasions instance) => <String, dynamic>{
      '_id': instance.Id,
      'name': instance.name,
      'slug': instance.slug,
      'image': instance.image,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
