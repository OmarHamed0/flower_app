import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/domain/entities/address/address_model.dart';
import 'package:injectable/injectable.dart';

import '../../repositories/address_repo/address_repository.dart';

@injectable
class AddressUsecase {
  final AddressRepository _addressRepository;
  AddressUsecase(this._addressRepository);

  Future<ApiResult<List<AddressModel>>> getSavedAddresses() async {
    return await _addressRepository.getSavedAddresses();
  }

  Future<ApiResult<String?>> deleteAddress(String addressId) async {
    return await _addressRepository.deleteAddress(addressId);
  }

  Future<ApiResult<String?>> addNewAddress(AddressModel addressModel) async {
    return await _addressRepository.addNewAddress(addressModel);
  }
}
