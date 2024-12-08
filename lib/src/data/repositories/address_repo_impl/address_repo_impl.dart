import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/data/data_sources/offline_data_source/address_offline_datasource/address_offline_datasouce.dart';
import 'package:flower_app/src/data/data_sources/online_data_source/address_datasource/address_online_datasource.dart';
import 'package:flower_app/src/domain/entities/address/address_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/api_execute.dart';
import '../../../domain/repositories/address_repo/address_repository.dart';

@Injectable(as: AddressRepository)
class AddressRepoImpl implements AddressRepository {
  AddressOfflineDatasource _addressOfflineDatasource;
  AddressOnlineDatasource _addressOnlineDatasource;
  AddressRepoImpl(
      this._addressOfflineDatasource, this._addressOnlineDatasource);
  @override
  Future<ApiResult<List<AddressModel>>> getSavedAddresses() async {
    bool isAdded = await _addressOfflineDatasource.isAddressAdded();
    if (!isAdded) {
      try {
        final cacheAddresses =
            await _addressOfflineDatasource.getCacheAddresses();
        return Success(data: cacheAddresses);
      } catch (e) {
        return Failures(exception: Exception(e));
      }
    } else {
      return await executeApi<List<AddressModel>>(
        apiCall: () async {
          String? token = await _addressOfflineDatasource.getToken();
          var response =
              await _addressOnlineDatasource.getSavedAddresses(token!);

          // Transform the DTO to Model
          List<AddressModel> models = response.addresses
                  ?.map((addressDto) => addressDto.toModel())
                  .toList() ??
              [];

          // Save to cache
          for (var address in models) {
            await _addressOfflineDatasource.saveCacheAddresses(address);
          }

          return models; // Return the list of AddressModel
        },
      );
    }
  }

  @override
  Future<ApiResult<String?>> deleteAddress(String addressId) async {
    return executeApi<String?>(
      apiCall: () async {
        String? token = await _addressOfflineDatasource.getToken();
        var response =
            await _addressOnlineDatasource.deleteAddress(token!, addressId);
        await _addressOfflineDatasource.deleteAddress(addressId);
        await _addressOfflineDatasource.setAddressAdded(true);
        return response;
      },
    );
  }
}
