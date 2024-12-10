import 'package:bloc/bloc.dart';
import 'package:flower_app/common/common.dart';
import 'package:flower_app/src/data/api/core/error/error_handler.dart';
import 'package:injectable/injectable.dart';

import '../../../../../common/api_result.dart';
import '../../../../domain/entities/address/address_model.dart';
import '../../../../domain/use_cases/address/address_usecase.dart';
import 'add_address_screen_state.dart';

@injectable
class AddAddressScreenViewModel extends Cubit<AddAddressScreenState> {
  AddressUsecase _addressUsecase;
  AddAddressScreenViewModel(this._addressUsecase)
      : super(AddAddressScreenInitial());

  TextEditingController streetController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> addNewAddress() async {
    if (formKey.currentState!.validate()) {
      emit(AddAddressScreenLoading());
      var result = await _addressUsecase.addNewAddress(
        AddressModel(
          street: streetController.text,
          city: cityController.text,
          phone: phoneController.text,
        ),
      );
      switch (result) {
        case Success<String?>():
          emit(AddAddressScreenSuccessful());
          break;
        case Failures<String?>():
          emit(AddAddressScreenError(result.exception));
          break;
      }
    }
  }
}
