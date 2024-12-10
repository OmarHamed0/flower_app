class CheckOutStates{}
class InitialCheckOutState extends CheckOutStates{}
class SwitchToggleState extends CheckOutStates{
  final bool isSwitched;
  SwitchToggleState(this.isSwitched);
}
class PlaceOrderState extends CheckOutStates{}