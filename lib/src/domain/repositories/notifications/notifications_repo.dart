import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/domain/entities/notifications/notifications_entity.dart';

abstract interface class NotificationsRepo {
  Future<ApiResult<List<NotificationEntity>>> getAllNotifications();
}
