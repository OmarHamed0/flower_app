import 'package:flower_app/src/data/api/api_services.dart';
import 'package:flower_app/src/data/api/core/response_model/product_response_models/one_product_response_model.dart';
import 'package:flower_app/src/data/data_sources/online_data_source/product_data_source/product_online_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:ProductOnlineDataSource)
class ProductOnlineDataSourceImpl implements ProductOnlineDataSource{
  ApiServices _apiServices;
  ProductOnlineDataSourceImpl(this._apiServices);
  @override
  Future<OneProductResponseModel> getProductById(String id) async{
    return await _apiServices.getProductById(id);
  }

}