import 'package:bloc/bloc.dart';
import 'package:flower_app/common/common.dart';
import 'package:flower_app/src/presentation/managers/checkout/checkout_actions.dart';
import 'package:flower_app/src/presentation/managers/checkout/checkout_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckoutViewModel extends Cubit<CheckOutStates>{
  CheckoutViewModel(): super(InitialCheckOutState());
  bool isSwitched = false;
  final ScrollController scrollController = ScrollController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Future<void> _dispose() async {
    nameController.dispose();
    phoneController.dispose();
    scrollController.dispose();
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "The name field is required";
    }
    return null;
  }
  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return "The phone field is required";
    }
    if (value.length < 11) {
      return "The phone number must be at least 11 characters";
    }
    return null;
  }

  void _switchToggle(){
    isSwitched = !isSwitched;
    emit(SwitchToggleState(isSwitched));
  }
  void doAction(CheckoutActions action){
    switch (action) {
      case SwitchToggleAction():
        _switchToggle();
        break;
      case AddNewAddressAction():
        // TODO: Handle this case.
    }
  }
}