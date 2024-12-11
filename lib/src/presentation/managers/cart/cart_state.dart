part of 'cart_view_model.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}
class AddCartLoadingState extends CartState{}
class AddCartSuccessState extends CartState{}
class AddCartErrorState extends CartState{
  final Exception exception;
  AddCartErrorState({required this.exception});
}



class GetLoggedUserCartLoadingState extends CartState{}
class GetLoggedUserCartSuccessState extends CartState{}
class GetLoggedUserCartErrorState extends CartState{
  final Exception exception;
  GetLoggedUserCartErrorState({required this.exception});
}





class RemoveSpecificCartLoadingState extends CartState{}
class RemoveSpecificCartSuccessState extends CartState{}
class RemoveSpecificCartErrorState extends CartState{
  final Exception exception;
  RemoveSpecificCartErrorState({required this.exception});
}



class UpdateQuantityState extends CartState{}


class UpdateQuantityLoadingState extends CartState{}
class UpdateQuantitySuccessState extends CartState{}
class UpdateQuantityErrorState extends CartState{
  final Exception exception;
  UpdateQuantityErrorState({required this.exception});
}



