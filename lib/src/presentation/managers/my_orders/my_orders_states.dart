class MyOrdersStates{}
class InitialMyOrdersState extends MyOrdersStates{}
class LoadingMyOrdersState extends MyOrdersStates{}
class ActiveOrdersLoadedState extends MyOrdersStates{}
class CompletedOrdersLoadedState extends MyOrdersStates{}
class ErrorMyOrdersState extends MyOrdersStates{
  final Exception? exception;
  ErrorMyOrdersState({this.exception});
}