import 'package:flower_app/common/api_execute.dart';
import 'package:flower_app/src/data/data_sources/online_data_source/home_online_datasource.dart';
import 'package:flower_app/src/domain/entities/home/HomeResponseModel.dart';
import 'package:injectable/injectable.dart';

import '../../../common/api_result.dart';
import '../../domain/repositories/home_repository.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeOnlineDataSource homeDataSource;

  HomeRepositoryImpl({required this.homeDataSource});

  @override
  Future<ApiResult<HomeResponseModel>> getHomeData() async {
    return executeApi<HomeResponseModel>(apiCall: () async {
      var response = await homeDataSource.getHomeData();
      HomeResponseModel result = response.toEntity();
      return result;
    });
  }
}
