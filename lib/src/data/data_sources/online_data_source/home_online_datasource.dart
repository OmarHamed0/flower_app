import '../../api/core/response_model/home_response/home_response.dart';

abstract interface class HomeOnlineDataSource {
  Future<HomeResponse> getHomeData();
}
