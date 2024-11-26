part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

class GetProductLoadingState extends ProductState {}

class GetProductSuccessState extends ProductState {
  final List<ProductEntity> products;
  GetProductSuccessState({required this.products});
}

class GetProductErrorState extends ProductState {
  final String errorMassage;
  GetProductErrorState({required this.errorMassage});
}


class GetBesetSellerLoadingState extends ProductState {}

class GetBesetSellerSuccessState extends ProductState {
  final List<ProductEntity> products;
  GetBesetSellerSuccessState({required this.products});
}

class GetBesetSellerErrorState extends ProductState {
  final String errorMassage;
  GetBesetSellerErrorState({required this.errorMassage});
}
