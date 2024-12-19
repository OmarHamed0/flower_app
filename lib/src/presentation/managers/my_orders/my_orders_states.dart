import 'package:flower_app/src/domain/entities/cart/cart_entity.dart';
import 'package:flower_app/src/domain/entities/cart/cart_product_entity.dart';

class MyOrdersStates{}
class InitialMyOrdersState extends MyOrdersStates{}
class LoadingMyOrdersState extends MyOrdersStates{}
class LoadedMyOrdersState extends MyOrdersStates{
  List<CartEntity>? cartItems;
  LoadedMyOrdersState({this.cartItems});
}
class ErrorMyOrdersState extends MyOrdersStates{
  final Exception? exception;
  ErrorMyOrdersState({this.exception});
}