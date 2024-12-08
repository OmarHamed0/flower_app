import 'package:flower_app/src/domain/entities/address/address_model.dart';

abstract interface class AddressOfflineDatasource {
  Future<String?> getToken();

  Future<List<AddressModel>> getCacheAddresses();
  Future<void> saveCacheAddresses(AddressModel address);

  Future<bool> isAddressAdded();
  Future<void> setAddressAdded(bool isAdded);
  Future<void> deleteAddress(String addressId);
}
