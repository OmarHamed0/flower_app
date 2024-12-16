import 'package:flower_app/src/data/api/core/notifications/all_notifications_response_model.dart';

abstract interface class NotificationsOnlineDataSource {
  Future<AllNotificationsResponseModel> getNotifications(String token);
}