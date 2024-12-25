import 'package:bloc/bloc.dart';
import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/common/common.dart';
import 'package:flower_app/src/domain/entities/address/address_model.dart';
import 'package:flower_app/src/domain/entities/cart/cart_entity.dart';
import 'package:flower_app/src/domain/entities/checkout/cash_checkout_entity.dart';
import 'package:flower_app/src/domain/entities/checkout/credit_checkout_entity.dart';
import 'package:flower_app/src/domain/entities/checkout/place_order_request_entity.dart';
import 'package:flower_app/src/domain/entities/place_order/shipping_address_entity.dart';
import 'package:flower_app/src/domain/use_cases/checkout/checkout_use_cases.dart';
import 'package:flower_app/src/presentation/managers/checkout/checkout_actions.dart';
import 'package:flower_app/src/presentation/managers/checkout/checkout_states.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../domain/use_cases/place_order/checkout_use_case.dart';

@injectable
class CheckoutViewModel extends Cubit<CheckOutStates> {
  final PlaceOrderUserCases _placeOrderUserCases;
  final CheckoutUseCase _checkoutUseCase;

  CheckoutViewModel(this._placeOrderUserCases, this._checkoutUseCase)
      : super(InitialCheckOutState());
  bool isSwitched = false;
  final ScrollController scrollController = ScrollController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  PaymentMethodEnum selectedPaymentMethod = PaymentMethodEnum.cash;
  List<AddressModel> userSavedAddress = [];
  int selectedAddressIndex = 0;
  num _deliveryFee = 10;

  Future<void> _dispose() async {
    nameController.dispose();
    phoneController.dispose();
    scrollController.dispose();
  }

  Future<void> launchCheckoutUrl(String ulr) async {
    Uri _url = Uri.parse(ulr);
    if (!await launchUrl(_url)) {
      emit(FailedCheckoutState(exception: Exception("Can't open the url")));
    }
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

  _creditCartCheckout() async {
    PlaceOrderRequestEntity placeOrderRequestEntity = PlaceOrderRequestEntity(
        shippingAddressEntity: ShippingAddressEntity(
            street: userSavedAddress[selectedAddressIndex].street,
            phone: userSavedAddress[selectedAddressIndex].phone,
            city: userSavedAddress[selectedAddressIndex].city));
    var response =
        await _checkoutUseCase.creditCheckout(placeOrderRequestEntity);
    switch (response) {
      case Success<CreditCheckoutEntity>():
        emit(CreditCardSuccessState(url: response.data!.session.url));
        break;
      case Failures<CreditCheckoutEntity>():
        emit(FailedCheckoutState(exception: response.exception));
    }
  }

  _cashCheckout() async {
    PlaceOrderRequestEntity placeOrderRequestEntity = PlaceOrderRequestEntity(
        shippingAddressEntity: ShippingAddressEntity(
            street: userSavedAddress[selectedAddressIndex].street,
            phone: userSavedAddress[selectedAddressIndex].phone,
            city: userSavedAddress[selectedAddressIndex].city));
    var response = await _checkoutUseCase.cashCheckout(placeOrderRequestEntity);
    switch (response) {
      case Success<CashCheckoutEntity>():
        emit(CashSuccessState());
        break;
      case Failures<CashCheckoutEntity>():
         emit(FailedCheckoutState(exception: response.exception));
         break;
    }
  }

  _placeOrder() async {
    bool isValidToPlace = false;
    if (isSwitched == true) {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        _dispose();
        isValidToPlace = true;
      }
    } else {
      _dispose();
      isValidToPlace = true;
    }
    if (isValidToPlace) {
      emit(PlaceOrderLoadingState());
      switch (selectedPaymentMethod) {
        case PaymentMethodEnum.cash:
          _cashCheckout();
          break;
        case PaymentMethodEnum.creditCard:
          _creditCartCheckout();
          break;
      }
    }
  }

  void _getUserSavedAddress() async {
    emit(LoadingState());
    var savedAddresses = await _placeOrderUserCases.getSavedAddresses();
    switch (savedAddresses) {
      case Success<List<AddressModel>>():
        userSavedAddress = savedAddresses.data!;
        emit(SuccessGetUserSavedAddressState(
            savedAddresses: savedAddresses.data));
        break;
      case Failures<List<AddressModel>>():
        emit(FailGetTotalPriceState(exception: savedAddresses.exception));
        break;
    }
  }

  void _getTotalPrice() async {
    emit(LoadingState());
    var userCart = await _placeOrderUserCases.getLoggedUserCart();
    switch (userCart) {
      case Success<CartEntity>():
        emit(TotalPriceState(
            totalPrice: userCart.data!.totalPrice, deliveryFee: _deliveryFee));
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
