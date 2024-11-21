import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/domain/entities/home/HomeResponseModel.dart';

abstract interface class HomeRepository {
  Future<ApiResult<HomeResponseModel>> getHomeData();
}
