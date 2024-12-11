import 'package:bloc/bloc.dart';
import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/common/common.dart';
import 'package:flower_app/src/domain/entities/address/address_model.dart';
import 'package:flower_app/src/domain/entities/cart/cart_entity.dart';
import 'package:flower_app/src/domain/use_cases/chackout/checkout_use_case.dart';
import 'package:flower_app/src/presentation/managers/checkout/checkout_actions.dart';
import 'package:flower_app/src/presentation/managers/checkout/checkout_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckoutViewModel extends Cubit<CheckOutStates> {
  final CheckoutUseCases _checkoutUseCase;
  CheckoutViewModel(this._checkoutUseCase) : super(InitialCheckOutState());
  bool isSwitched = false;
  final ScrollController scrollController = ScrollController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  PaymentMethodEnum selectedPaymentMethod = PaymentMethodEnum.cash;
  num _deliveryFee = 10;

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
        _dispose();
        emit(PlaceOrderState());
      }
    } else {
      _dispose();
      emit(PlaceOrderState());
    }
  }

  void _getUserSavedAddress() async{
    emit(LoadingState());
    var savedAddresses = await _checkoutUseCase.getSavedAddresses();
    switch (savedAddresses) {
      case Success<List<AddressModel>>():
        emit(SuccessGetUserSavedAddressState(savedAddresses: savedAddresses.data));
        break;
      case Failures<List<AddressModel>>():
        emit(FailGetTotalPriceState(exception: savedAddresses.exception));
        break;
    }
  }

  void _getTotalPrice() async{
    emit(LoadingState());
    var userCart = await _checkoutUseCase.getLoggedUserCart();
    switch (userCart) {
      case Success<CartEntity>():
         emit(TotalPriceState(totalPrice: userCart.data!.totalPrice, deliveryFee: _deliveryFee));
         break;
      case Failures<CartEntity>():
        emit(FailGetTotalPriceState(exception: userCart.exception));
    }
  }
  void doAction(CheckoutActions action) {
    switch (action) {
      case SwitchToggleAction():
        _switchToggle();
        break;
      case AddNewAddressAction():
        emit(AddNewAddressState());
        break;
      case PlaceOrderAction():
        _placeOrder();
        break;
      case GetTotalPriceAction():
        _getTotalPrice();
        break;
      case GetUserSavedAddressAction():
        _getUserSavedAddress();
        break;
    }
  }
}

enum PaymentMethodEnum { cash, creditCard }
