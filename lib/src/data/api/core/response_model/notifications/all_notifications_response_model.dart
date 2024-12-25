import 'package:json_annotation/json_annotation.dart';

part 'all_notifications_response_model.g.dart';

@JsonSerializable()
class AllNotificationsResponseModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final Metadata? metadata;
  @JsonKey(name: "notifications")
  final List<Notifications>? notifications;

  AllNotificationsResponseModel ({
    this.message,
    this.metadata,
    this.notifications,
  });

  factory AllNotificationsResponseModel.fromJson(Map<String, dynamic> json) {
    return _$AllNotificationsResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AllNotificationsResponseModelToJson(this);
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
class Notifications {
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

  Notifications ({
    this.Id,
    this.title,
    this.body,
    this.createdAt,
    this.updatedAt,
  });

  factory Notifications.fromJson(Map<String, dynamic> json) {
    return _$NotificationsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$NotificationsToJson(this);
  }
}


