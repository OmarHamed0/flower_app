import 'package:flower_app/src/data/api/api_services.dart';
import 'package:flower_app/src/data/models/address/address_response_dto.dart';
import 'package:injectable/injectable.dart';

import 'address_online_datasource.dart';

@Injectable(as: AddressOnlineDatasource)
class AddressOnlineDataSourceImpl implements AddressOnlineDatasource {
  ApiServices _apiServices;
  AddressOnlineDataSourceImpl(this._apiServices);
  @override
  Future<AddressResponseDto> getSavedAddresses(String token) async {
    var tokenWithBearer = 'Bearer $token';
    var response = await _apiServices.getSavedAddresses(tokenWithBearer);
    return response.toDto();
  }

  @override
  Future<String?> deleteAddress(String token, String addressId) async {
    var tokenWithBearer = 'Bearer $token';
    var response = await _apiServices.deleteAddress(tokenWithBearer, addressId);
    return response.message;
  }
}
