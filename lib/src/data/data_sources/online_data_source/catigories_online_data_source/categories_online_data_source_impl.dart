
import 'package:flower_app/src/data/api/api_services.dart';
import 'package:flower_app/src/data/api/core/response_model/get_catigories/get_catigories_resonse_model.dart';
import 'package:flower_app/src/data/data_sources/online_data_source/catigories_online_data_source/catigories_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesOnlineDataSource)
class CategoriesOnlineDataSourceImpl implements CategoriesOnlineDataSource{
  ApiServices _apiServices;
  CategoriesOnlineDataSourceImpl(this._apiServices);
  @override
  Future<GetCatigoriesResponseModel> getCategories() async{
    return await _apiServices.getCategories();
  }

}