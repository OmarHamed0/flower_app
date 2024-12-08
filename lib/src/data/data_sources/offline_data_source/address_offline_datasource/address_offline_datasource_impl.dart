import 'package:flower_app/src/data/data_sources/offline_data_source/address_offline_datasource/address_offline_datasouce.dart';
import 'package:flower_app/src/domain/entities/address/address_hive.dart';
import 'package:flower_app/src/domain/entities/address/address_model.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/helpers/hive_module.dart';
import '../../../../../config/helpers/shared_pre_keys.dart';
import '../../../../../config/helpers/shared_pref_helper.dart';

@Injectable(as: AddressOfflineDatasource)
class AddressOfflineDataSourceImpl implements AddressOfflineDatasource {
  final HiveModule _hiveModule;
  AddressOfflineDataSourceImpl(this._hiveModule);

  @override
  Future<String?> getToken() async {
    return await SharedPrefHelper.getSecureString(SharedPrefKeys.userToken);
  }

  @override
  Future<List<AddressModel>> getCacheAddresses() async {
    final Box<AddressHive> hiveAddresses = _hiveModule.addressBox;
    final hiveAddress = hiveAddresses.values.toList();
    return hiveAddress
        .map((hiveAddress) => AddressModel(
              id: hiveAddress.id,
              street: hiveAddress.street,
              phone: hiveAddress.phone,
              city: hiveAddress.city,
            ))
        .toList();
  }

  @override
  Future<void> saveCacheAddresses(AddressModel address) async {
    final addressId = address.id;
    final Box<AddressHive> hiveBox = _hiveModule.addressBox;

    final hiveAddress = AddressHive(
      id: addressId,
      street: address.street,
      phone: address.phone,
      city: address.city,
    );
    hiveBox.put(addressId, hiveAddress);
  }

  @override
  Future<bool> isAddressAdded() async {
    return await SharedPrefHelper.getBoolean(SharedPrefKeys.isAddressAdded) ??
        true;
  }

  @override
  Future<void> setAddressAdded(bool isAdded) {
    return SharedPrefHelper.setDate(SharedPrefKeys.isAddressAdded, isAdded);
  }

  @override
  Future<void> deleteAddress(String addressId) async {
    final Box<AddressHive> hiveBox = _hiveModule.addressBox;
    hiveBox.delete(addressId);
  }
}
