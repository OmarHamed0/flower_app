import 'package:flower_app/src/data/api/core/notifications/all_notifications_response_model.dart';
import 'package:flower_app/src/domain/entities/notifications/notifications_entity.dart';

class NotificationsDto{
  final String? id;
  final String? title;
  final String? body;
  final String? createdAt;
  final String? updatedAt;


  NotificationsDto({
    this.id,
    this.title,
    this.body,
    this.createdAt,
    this.updatedAt,
  });

  List<NotificationEntity> toDomain(AllNotificationsResponseModel response){
    return response.notifications!.map((e) => NotificationEntity(
      id: e.Id,
      title: e.title,
      body: e.body,
      createdAt: e.createdAt,
      updatedAt: e.updatedAt,
    )).toList();
  }
}