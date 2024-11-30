import 'package:flower_app/common/api_execute.dart';
import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/data/data_sources/online_data_source/occasion_online_data_source/OccasionOnlineDataSource.dart';
import 'package:flower_app/src/data/models/occasion_model_dto/OccasionModelDto.dart';
import 'package:flower_app/src/domain/entities/occasions/OccasionsEntity.dart';
import 'package:flower_app/src/domain/repositories/occasion_repo/OccasionRepo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OccasionRepo)
class OccasionsRepoImpl implements OccasionRepo {
  final OccasionOnlineDataSource _occasionDataSource;
  OccasionsRepoImpl(this._occasionDataSource);
  @override
  Future<ApiResult<List<OccasionsEntity>>> getOccasions() async{
    return await executeApi<List<OccasionsEntity>>(apiCall: () async{
      var response = await _occasionDataSource.getOccasions();
      return OccasionModelDto().toDomain(response);
    });
  }
}