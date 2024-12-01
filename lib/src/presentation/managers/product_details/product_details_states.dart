class ProductDetailsStates{}
class InitialState extends ProductDetailsStates{}
class LoadingState extends ProductDetailsStates{}
class SuccessState extends ProductDetailsStates{}
class FailedState extends ProductDetailsStates{
  String? error;
  FailedState({this.error});
}