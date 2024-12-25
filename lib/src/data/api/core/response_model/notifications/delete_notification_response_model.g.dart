// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_notification_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteNotificationResponseModel _$DeleteNotificationResponseModelFromJson(
        Map<String, dynamic> json) =>
    DeleteNotificationResponseModel(
      message: json['message'] as String?,
      document: json['document'] == null
          ? null
          : Document.fromJson(json['document'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DeleteNotificationResponseModelToJson(
        DeleteNotificationResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'document': instance.document,
    };

Document _$DocumentFromJson(Map<String, dynamic> json) => Document(
      Id: json['_id'] as String?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$DocumentToJson(Document instance) => <String, dynamic>{
      '_id': instance.Id,
      'title': instance.title,
      'body': instance.body,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
