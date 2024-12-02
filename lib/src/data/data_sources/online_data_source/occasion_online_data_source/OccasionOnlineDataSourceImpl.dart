import 'package:flower_app/src/data/api/api_services.dart';
import 'package:flower_app/src/data/api/core/response_model/occasions/occasion_response_model.dart';
import 'package:flower_app/src/data/data_sources/online_data_source/occasion_online_data_source/OccasionOnlineDataSource.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OccasionOnlineDataSource)
class OccasionOnlineDataSourceImpl implements OccasionOnlineDataSource {
  final ApiServices _apiServices;
  OccasionOnlineDataSourceImpl(this._apiServices);
  @override
  Future<OccasionResponseModel> getOccasions() async {
    return await _apiServices.getOccasions();
  }
}