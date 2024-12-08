import '../../../models/address/address_response_dto.dart';

abstract interface class AddressOnlineDatasource {
  Future<AddressResponseDto> getSavedAddresses(String token);
  Future<String?> deleteAddress(String token, String addressId);
}
