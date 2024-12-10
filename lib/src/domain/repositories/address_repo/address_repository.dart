import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/domain/entities/address/address_model.dart';

abstract interface class AddressRepository {
  Future<ApiResult<List<AddressModel>>> getSavedAddresses();
  Future<ApiResult<String?>> deleteAddress(String addressId);
  Future<ApiResult<String?>> addNewAddress(AddressModel addressModel);
}
