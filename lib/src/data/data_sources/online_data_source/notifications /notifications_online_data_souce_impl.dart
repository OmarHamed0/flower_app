
import 'package:flower_app/src/data/api/api_services.dart';
import 'package:flower_app/src/data/api/core/notifications/all_notifications_response_model.dart';
import 'package:flower_app/src/data/data_sources/online_data_source/notifications%20/notifications_online_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: NotificationsOnlineDataSource)
class NotificationsOnlineDataSourceImpl implements NotificationsOnlineDataSource {
  final ApiServices _apiServices;
  NotificationsOnlineDataSourceImpl(this._apiServices);
  @override
  Future<AllNotificationsResponseModel> getNotifications(String token) async{
      return await _apiServices.getAllNotifications("Bearer $token");
  }
}