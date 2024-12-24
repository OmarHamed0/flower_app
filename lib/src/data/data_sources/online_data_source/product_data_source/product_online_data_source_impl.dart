import 'package:flower_app/src/data/api/api_services.dart';
import '../../../api/core/response_model/beset_seller/beset_seller_model.dart';
import 'package:flower_app/src/data/api/core/response_model/product_response_models/one_product_response_model.dart';
import 'package:flower_app/src/data/data_sources/online_data_source/product_data_source/product_online_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../api/core/response_model/product/product_response_model.dart';

@Injectable(as:ProductOnlineDataSource)
class ProductOnlineDataSourceImpl implements ProductOnlineDataSource{
  final ApiServices _apiServices;
  ProductOnlineDataSourceImpl(this._apiServices);
  @override
  Future<OneProductResponseModel> getProductById(String id) async{
    return await _apiServices.getProductById(id);
  }

  @override
  Future<ProductResponseModel> getProduct({ Map<String, dynamic> ? query}) async{
    return await _apiServices.getProduct(query: query);
  }

  @override
  Future<BesetSellerModel> getProductBesetSeller({ Map<String, dynamic> ? query}) async{
    return await _apiServices.getProductBesetSeller(query: query);

  }



}