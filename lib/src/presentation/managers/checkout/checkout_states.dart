import 'package:flower_app/src/domain/entities/address/address_model.dart';

class CheckOutStates{}
class InitialCheckOutState extends CheckOutStates{}
class SwitchToggleState extends CheckOutStates{
  final bool isSwitched;
  SwitchToggleState(this.isSwitched);
}
class PlaceOrderState extends CheckOutStates{}
class TotalPriceState extends CheckOutStates{
  num? totalPrice;
  num? deliveryFee;
  TotalPriceState({this.totalPrice, this.deliveryFee});
}
class FailGetTotalPriceState extends CheckOutStates{
  Exception? exception;
  FailGetTotalPriceState({this.exception});
}
class LoadingState extends CheckOutStates{}
class AddNewAddressState extends CheckOutStates{}
class SuccessGetUserSavedAddressState  extends CheckOutStates{
  List<AddressModel>? savedAddresses;
  SuccessGetUserSavedAddressState({this.savedAddresses});
}
class FailGetUserSavedAddressState extends CheckOutStates{
  Exception? exception;
  FailGetUserSavedAddressState({this.exception});
}
class PlaceOrderSuccessState extends CheckOutStates{}
class PlaceOrderFailState extends CheckOutStates{
  Exception? exception;
  PlaceOrderFailState({this.exception});
}