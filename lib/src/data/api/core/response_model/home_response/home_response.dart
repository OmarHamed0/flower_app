import 'package:flower_app/src/data/api/core/response_model/home_response/product.dart';
import 'package:flower_app/src/domain/entities/home/HomeResponseModel.dart';
import 'package:json_annotation/json_annotation.dart';

import 'best_seller.dart';
import 'categories.dart';
import 'occasions.dart';

part 'home_response.g.dart';

@JsonSerializable()
class HomeResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "categories")
  final List<Categories>? categories;
  @JsonKey(name: "products")
  final List<Products>? products;
  @JsonKey(name: "bestSeller")
  final List<BestSeller>? bestSeller;
  @JsonKey(name: "occasions")
  final List<Occasions>? occasions;

  HomeResponse({
    this.message,
    this.products,
    this.bestSeller,
    this.occasions,
    this.categories,
  });

  factory HomeResponse.fromJson(Map<String, dynamic> json) {
    return _$HomeResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$HomeResponseToJson(this);
  }

  HomeResponseModel toEntity() {
    return HomeResponseModel(
      message: message,
      products: products?.map((e) => e.toEntity()).toList(),
      bestSeller: bestSeller?.map((e) => e.toEntity()).toList(),
      occasions: occasions?.map((e) => e.toEntity()).toList(),
      categories: categories?.map((e) => e.toEntity()).toList(),
    );
  }
}
