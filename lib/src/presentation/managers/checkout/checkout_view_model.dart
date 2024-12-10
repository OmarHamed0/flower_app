import 'package:bloc/bloc.dart';
import 'package:flower_app/common/common.dart';
import 'package:flower_app/src/domain/use_cases/chackout/checkout_use_case.dart';
import 'package:flower_app/src/presentation/managers/checkout/checkout_actions.dart';
import 'package:flower_app/src/presentation/managers/checkout/checkout_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckoutViewModel extends Cubit<CheckOutStates> {
  final CheckoutUseCase _checkoutUseCase;
  CheckoutViewModel(this._checkoutUseCase) : super(InitialCheckOutState());
  bool isSwitched = false;
  final ScrollController scrollController = ScrollController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  PaymentMethodEnum selectedPaymentMethod = PaymentMethodEnum.cash;

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
    if (value.length != 11) {
      return "The phone number must be 11 characters";
    }
    return null;
  }

  void _switchToggle() {
    isSwitched = !isSwitched;
    emit(SwitchToggleState(isSwitched));
  }

  _placeOrder() {
    if (isSwitched == true) {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        emit(PlaceOrderState());
      }
    } else {
      emit(PlaceOrderState());
    }
  }

  void doAction(CheckoutActions action) {
    switch (action) {
      case SwitchToggleAction():
        _switchToggle();
        break;
      case AddNewAddressAction():
        break;
      case PlaceOrderAction():
        _placeOrder();
        _dispose();
        break;
    }
  }
}

enum PaymentMethodEnum { cash, creditCard }
