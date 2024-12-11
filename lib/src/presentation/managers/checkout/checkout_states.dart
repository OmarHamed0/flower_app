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