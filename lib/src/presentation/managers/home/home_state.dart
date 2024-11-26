import 'package:flower_app/src/domain/entities/home/product_model.dart';

import '../../../domain/entities/home/best_seller_model.dart';
import '../../../domain/entities/home/occasion_model.dart';

sealed class HomeState {
  const HomeState();
}

class HomeStateLoading extends HomeState {
  const HomeStateLoading();
}

class HomeStateSuccess extends HomeState {
  final ProductLists? products;
  const HomeStateSuccess({
    this.products,
  });
}

class HomeStateFailure extends HomeState {
  final String message;
  const HomeStateFailure(this.message);
}

class PopDialogState extends HomeState {}

class ProductLists {
  final List<ProductsModel>? products;
  final List<BestSellerModel>? bestSeller;
  final List<OccasionsModel>? occasions;
  ProductLists({
    this.products,
    this.bestSeller,
    this.occasions,
  });
}
