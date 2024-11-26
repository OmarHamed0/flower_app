import 'package:flower_app/src/data/api/core/response_model/get_catigories/get_catigories_resonse_model.dart';

abstract interface class CategoriesOnlineDataSource {
  Future<GetCatigoriesResponseModel> getCategories();
}
