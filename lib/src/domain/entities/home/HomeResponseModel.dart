import 'package:flower_app/src/domain/entities/home/product_model.dart';

import 'best_seller_model.dart';
import 'occasion_model.dart';

class HomeResponseModel {
  HomeResponseModel({
    String? message,
    List<ProductsModel>? products,
    List<BestSellerModel>? bestSeller,
    List<OccasionsModel>? occasions,
  }) {
    _message = message;
    _products = products;
    _bestSeller = bestSeller;
    _occasions = occasions;
  }

  HomeResponseModel.fromJson(dynamic json) {
    _message = json['message'];
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(ProductsModel.fromJson(v));
      });
    }
    if (json['bestSeller'] != null) {
      _bestSeller = [];
      json['bestSeller'].forEach((v) {
        _bestSeller?.add(BestSellerModel.fromJson(v));
      });
    }
    if (json['occasions'] != null) {
      _occasions = [];
      json['occasions'].forEach((v) {
        _occasions?.add(OccasionsModel.fromJson(v));
      });
    }
  }
  String? _message;
  List<ProductsModel>? _products;
  List<BestSellerModel>? _bestSeller;
  List<OccasionsModel>? _occasions;

  String? get message => _message;
  List<ProductsModel>? get products => _products;
  List<BestSellerModel>? get bestSeller => _bestSeller;
  List<OccasionsModel>? get occasions => _occasions;

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
}
