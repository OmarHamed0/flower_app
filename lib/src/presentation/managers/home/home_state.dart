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
  final List<ProductsModel>? products;
  final List<BestSellerModel>? bestSeller;
  final List<OccasionsModel>? occasions;
  const HomeStateSuccess({
    this.products,
    this.bestSeller,
    this.occasions,
  });
}

class HomeStateFailure extends HomeState {
  final String message;
  const HomeStateFailure(this.message);
}
