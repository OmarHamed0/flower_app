import 'package:flower_app/src/domain/entities/orders_entity.dart';

import '../../../domain/entities/product_entity/product_entity.dart';

class MyOrdersStates{}
class InitialMyOrdersState extends MyOrdersStates{}
class LoadingMyOrdersState extends MyOrdersStates{}
class LoadedMyOrdersState extends MyOrdersStates{
  List<OrdersItems>? cartItems;
  LoadedMyOrdersState({this.cartItems});
}
class ErrorMyOrdersState extends MyOrdersStates{
  final Exception? exception;
  ErrorMyOrdersState({this.exception});
}
class SuccessGetProductDetailsState extends MyOrdersStates{
  final ProductEntity? productEntity;
  SuccessGetProductDetailsState({this.productEntity});
}

class FailureGetProductDetailsState extends MyOrdersStates{
  final Exception? exception;
  FailureGetProductDetailsState({this.exception});
}