import 'package:injectable/injectable.dart';

import '../../../common/api_result.dart';
import '../entities/home/HomeResponseModel.dart';
import '../repositories/home_repository.dart';

@injectable
class HomeUseCase {
  final HomeRepository _homeRepository;

  HomeUseCase(this._homeRepository);

  Future<ApiResult<HomeResponseModel>> getHomeData() async {
    return await _homeRepository.getHomeData();
  }
}
