// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'occasions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Occasions _$OccasionsFromJson(Map<String, dynamic> json) => Occasions(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      image: json['image'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$OccasionsToJson(Occasions instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'image': instance.image,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
