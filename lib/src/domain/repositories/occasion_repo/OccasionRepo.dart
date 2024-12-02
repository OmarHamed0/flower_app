import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/domain/entities/occasions/OccasionsEntity.dart';

abstract interface class OccasionRepo {
  Future<ApiResult<List<OccasionsEntity>>> getOccasions();
}