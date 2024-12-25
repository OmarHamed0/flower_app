import 'package:json_annotation/json_annotation.dart';

part 'delete_notification_response_model.g.dart';

@JsonSerializable()
class DeleteNotificationResponseModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "document")
  final Document? document;

  DeleteNotificationResponseModel ({
    this.message,
    this.document,
  });

  factory DeleteNotificationResponseModel.fromJson(Map<String, dynamic> json) {
    return _$DeleteNotificationResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DeleteNotificationResponseModelToJson(this);
  }
}

@JsonSerializable()
class Document {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "body")
  final String? body;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;

  Document ({
    this.Id,
    this.title,
    this.body,
    this.createdAt,
    this.updatedAt,
  });

  factory Document.fromJson(Map<String, dynamic> json) {
    return _$DocumentFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DocumentToJson(this);
  }
}


