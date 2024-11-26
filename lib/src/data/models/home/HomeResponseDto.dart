import 'package:flower_app/src/data/models/home/product_dto.dart';
import 'package:flower_app/src/domain/entities/home/HomeResponseModel.dart';

import 'best_seller_dto.dart';
import 'occasion_dto.dart';

class HomeResponseDto {
  HomeResponseDto({
    String? message,
    List<ProductsDto>? products,
    List<BestSellerDto>? bestSeller,
    List<OccasionsDto>? occasions,
  }) {
    _message = message;
    _products = products;
    _bestSeller = bestSeller;
    _occasions = occasions;
  }

  HomeResponseDto.fromJson(dynamic json) {
    _message = json['message'];
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(ProductsDto.fromJson(v));
      });
    }
    if (json['bestSeller'] != null) {
      _bestSeller = [];
      json['bestSeller'].forEach((v) {
        _bestSeller?.add(BestSellerDto.fromJson(v));
      });
    }
    if (json['occasions'] != null) {
      _occasions = [];
      json['occasions'].forEach((v) {
        _occasions?.add(OccasionsDto.fromJson(v));
      });
    }
  }
  String? _message;
  List<ProductsDto>? _products;
  List<BestSellerDto>? _bestSeller;
  List<OccasionsDto>? _occasions;

  String? get message => _message;
  List<ProductsDto>? get products => _products;
  List<BestSellerDto>? get bestSeller => _bestSeller;
  List<OccasionsDto>? get occasions => _occasions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    if (_bestSeller != null) {
      map['bestSeller'] = _bestSeller?.map((v) => v.toJson()).toList();
    }
    if (_occasions != null) {
      map['occasions'] = _occasions?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  HomeResponseModel toModel(HomeResponseDto homeResponseDto) {
    return HomeResponseModel(
      message: homeResponseDto.message,
      products: homeResponseDto.products?.map((e) => e.toModel(e)).toList(),
      bestSeller: homeResponseDto.bestSeller?.map((e) => e.toModel(e)).toList(),
      occasions: homeResponseDto.occasions?.map((e) => e.toModel(e)).toList(),
    );
  }
}
