import 'package:flower_app/src/domain/entities/home/category_model.dart';
import 'package:flower_app/src/domain/entities/home/product_model.dart';

import '../../../domain/entities/home/best_seller_model.dart';
import '../../../domain/entities/home/occasion_model.dart';

sealed class HomeState {
  const HomeState();
}

class HomeStateLoading extends HomeState {
  const HomeStateLoading();
}

class HomeStateInitial extends HomeState {
  const HomeStateInitial();
}

class HomeStateSuccess extends HomeState {
  final ProductLists? products;
  const HomeStateSuccess({
    this.products,
  });
}

class HomeStateFailure extends HomeState {
  final Exception exception;
  const HomeStateFailure(this.exception);
}

class PopDialogState extends HomeState {}

class ProductLists {
  final List<ProductsModel>? products;
  final List<BestSellerModel>? bestSeller;
  final List<OccasionsModel>? occasions;
  final List<CategoryModel>? categories;
  ProductLists({
    this.products,
    this.bestSeller,
    this.occasions,
    this.categories,
  });
}

class GoNextBesetSellerState extends HomeState {}
