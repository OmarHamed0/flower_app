import 'package:flower_app/src/data/api/api_services.dart';
import 'package:flower_app/src/data/api/core/response_model/home_response/home_response.dart';
import 'package:flower_app/src/data/data_sources/online_data_source/home_online_datasource.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeOnlineDataSource)
class HomeOnlineDataSourceImpl implements HomeOnlineDataSource {
  final ApiServices _apiServices;
  HomeOnlineDataSourceImpl(this._apiServices);

  @override
  Future<HomeResponse> getHomeData() async {
    var response = await _apiServices.getHomeData();

    return response;
  }
}
