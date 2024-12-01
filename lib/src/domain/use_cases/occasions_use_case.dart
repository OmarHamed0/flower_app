import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/domain/entities/occasions/OccasionsEntity.dart';
import 'package:flower_app/src/domain/repositories/occasion_repo/OccasionRepo.dart';
import 'package:injectable/injectable.dart';

@injectable
class OccasionUseCase{
  final OccasionRepo _occasionRepo;
  OccasionUseCase(this._occasionRepo);

  Future<ApiResult<List<OccasionsEntity>>> getOccasions() async {
    return await _occasionRepo.getOccasions();
  }
}