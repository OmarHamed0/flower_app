// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_notifications_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllNotificationsResponseModel _$AllNotificationsResponseModelFromJson(
        Map<String, dynamic> json) =>
    AllNotificationsResponseModel(
      message: json['message'] as String?,
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      notifications: (json['notifications'] as List<dynamic>?)
          ?.map((e) => Notifications.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllNotificationsResponseModelToJson(
        AllNotificationsResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'metadata': instance.metadata,
      'notifications': instance.notifications,
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

Notifications _$NotificationsFromJson(Map<String, dynamic> json) =>
    Notifications(
      Id: json['_id'] as String?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$NotificationsToJson(Notifications instance) =>
    <String, dynamic>{
      '_id': instance.Id,
      'title': instance.title,
      'body': instance.body,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
