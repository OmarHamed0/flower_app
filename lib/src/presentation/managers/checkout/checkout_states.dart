class CheckOutStates{}
class InitialCheckOutState extends CheckOutStates{}
class SwitchToggleState extends CheckOutStates{
  final bool isSwitched;
  SwitchToggleState(this.isSwitched);
}
class PlaceOrderState extends CheckOutStates{}
class TotalPriceState extends CheckOutStates{
  String? totalPrice;
  TotalPriceState({this.totalPrice});
}
class FailGetTotalPriceState extends CheckOutStates{
  String? message;
  FailGetTotalPriceState({this.message});
}
class LoadingState extends CheckOutStates{}