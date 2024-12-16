
import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/domain/entities/notifications/notifications_entity.dart';
import 'package:flower_app/src/domain/repositories/notifications/notifications_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class NotificationsUseCases{
  final NotificationsRepo _notificationsRepo;
  NotificationsUseCases(this._notificationsRepo);

  Future<ApiResult<List<NotificationEntity>>> getAllNotifications() async {
    return await _notificationsRepo.getAllNotifications();
  }

  Future<ApiResult<String>> deleteNotification(String notificationId) async {
    return await _notificationsRepo.deleteNotification(notificationId);
  }

}