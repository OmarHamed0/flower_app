

import 'package:flower_app/common/api_execute.dart';
import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/data/data_sources/offline_data_source/offline_data_source.dart';
import 'package:flower_app/src/data/data_sources/online_data_source/notifications%20/notifications_online_data_source.dart';
import 'package:flower_app/src/data/models/notifications/notifications_dto.dart';
import 'package:flower_app/src/domain/entities/notifications/notifications_entity.dart';
import 'package:flower_app/src/domain/repositories/notifications/notifications_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: NotificationsRepo)
class NotificationRepoImpl implements NotificationsRepo{
  final NotificationsOnlineDataSource _notificationsOnlineDataSource;
  final AuthOfflineDataSource _authOfflineDataSource;
  NotificationRepoImpl(this._authOfflineDataSource,this._notificationsOnlineDataSource);
  @override
  Future<ApiResult<List<NotificationEntity>>> getAllNotifications() async{
    final token = await _getToken();
    return await executeApi<List<NotificationEntity>>(apiCall: () async{
        var response = await _notificationsOnlineDataSource.getNotifications(token);
        return NotificationsDto().toDomain(response);
    });
  }

  Future<String> _getToken() async {
     return await _authOfflineDataSource.getToken()??"";
  }

  @override
  Future<ApiResult<String>> deleteNotification(String notificationId) async {
    final String token = await _getToken();
    return executeApi<String>(apiCall: () async{
        final response = await _notificationsOnlineDataSource.deleteNotification(token, notificationId);
        return response.message!;
    });
  }

}