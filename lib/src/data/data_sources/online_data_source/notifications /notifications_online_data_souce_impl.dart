
import 'package:flower_app/src/data/api/api_services.dart';
import 'package:flower_app/src/data/data_sources/online_data_source/notifications%20/notifications_online_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../api/core/response_model/notifications/all_notifications_response_model.dart';
import '../../../api/core/response_model/notifications/delete_notification_response_model.dart';

@Injectable(as: NotificationsOnlineDataSource)
class NotificationsOnlineDataSourceImpl implements NotificationsOnlineDataSource {
  final ApiServices _apiServices;
  NotificationsOnlineDataSourceImpl(this._apiServices);
  @override
  Future<AllNotificationsResponseModel> getNotifications(String token) async{
      return await _apiServices.getAllNotifications("Bearer $token");
  }

  @override
  Future<DeleteNotificationResponseModel> deleteNotification(String token, String notificationId) async{
      return await _apiServices.deleteNotification(token, notificationId);
  }

}