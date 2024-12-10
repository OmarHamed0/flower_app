import 'package:bloc/bloc.dart';
import 'package:flower_app/src/data/api/core/error/error_handler.dart';
import 'package:injectable/injectable.dart';

import '../../../../../common/api_result.dart';
import '../../../../domain/entities/address/address_model.dart';
import '../../../../domain/use_cases/address/address_usecase.dart';
import 'address_screen_state.dart';

@injectable
class AddressScreenViewModel extends Cubit<AddressScreenState> {
  AddressUsecase _addressUsecase;
  AddressScreenViewModel(this._addressUsecase) : super(AddressScreenInitial());

  Future<void> getSavedAddresses() async {
    emit(AddressScreenLoading());
    var result = await _addressUsecase.getSavedAddresses();
    switch (result) {
      case Success<List<AddressModel>>():
        emit(AddressScreenLoaded(result.data!));
        break;
      case Failures<List<AddressModel>>():
        var error = ErrorHandler.fromException(result.exception);
        emit(AddressScreenError(error.errorMassage));
        break;
    }
  }

  Future<void> deleteAddress(String addressId) async {
    emit(AddressScreenDeleting());
    var result = await _addressUsecase.deleteAddress(addressId);
    switch (result) {
      case Success<String?>():
        emit(AddressScreenDeleted(result.data!));
        break;
      case Failures<String?>():
        var error = ErrorHandler.fromException(result.exception);
        emit(AddressScreenDeleteError(error.errorMassage));
        break;
    }
  }
}
