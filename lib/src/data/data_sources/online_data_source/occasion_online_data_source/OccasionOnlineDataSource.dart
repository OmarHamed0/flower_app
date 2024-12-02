import 'package:flower_app/src/data/api/core/response_model/occasions/occasion_response_model.dart';

abstract interface class OccasionOnlineDataSource {
  Future<OccasionResponseModel> getOccasions();
}