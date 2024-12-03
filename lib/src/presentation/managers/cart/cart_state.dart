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



class GetLoggedUserCartLoadingState extends CartState{}
class GetLoggedUserCartSuccessState extends CartState{}
class GetLoggedUserCartErrorState extends CartState{
  final ErrorHandler errorHandler;
  GetLoggedUserCartErrorState({required this.errorHandler});
}





class RemoveSpecificCartLoadingState extends CartState{}
class RemoveSpecificCartSuccessState extends CartState{}
class RemoveSpecificCartErrorState extends CartState{
  final ErrorHandler errorHandler;
  RemoveSpecificCartErrorState({required this.errorHandler});
}



class UpdateQuantityState extends CartState{}


class UpdateQuantityLoadingState extends CartState{}
class UpdateQuantitySuccessState extends CartState{}
class UpdateQuantityErrorState extends CartState{
  final ErrorHandler errorHandler;
  UpdateQuantityErrorState({required this.errorHandler});
}



