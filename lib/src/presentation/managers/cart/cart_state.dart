part of 'cart_view_model.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}
class AddCartLoadingState extends CartState{}
class AddCartSuccessState extends CartState{}
class AddCartErrorState extends CartState{
  final ErrorHandler errorHandler;
  AddCartErrorState({required this.errorHandler});
}



