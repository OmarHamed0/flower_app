import 'package:flower_app/src/data/models/address/address_request_dto.dart';

import '../../../models/address/address_response_dto.dart';

abstract interface class AddressOnlineDatasource {
  Future<AddressResponseDto> getSavedAddresses(String token);
  Future<String?> deleteAddress(String token, String addressId);
  Future<String?> addNewAddress(
      String token, AddressRequestDTO addressRequestDTO);
}
