
import '../../../api/core/response_model/notifications/all_notifications_response_model.dart';
import '../../../api/core/response_model/notifications/delete_notification_response_model.dart';

abstract interface class NotificationsOnlineDataSource {
  Future<AllNotificationsResponseModel> getNotifications(String token);
  Future<DeleteNotificationResponseModel> deleteNotification(String token, String notificationId);
}