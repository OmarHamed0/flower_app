import 'package:json_annotation/json_annotation.dart';

part 'product_response_model.g.dart';

@JsonSerializable()
class ProductResponseModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "products")
  final List<Products>? products;

  ProductResponseModel ({
    this.message,
    this.products,
  });

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) {
    return _$ProductResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductResponseModelToJson(this);
  }
}

@JsonSerializable()
class Products {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "slug")
  final String? slug;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "imgCover")
  final String? imgCover;
  @JsonKey(name: "images")
  final List<String>? images;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "priceAfterDiscount")
  final int? priceAfterDiscount;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "category")
  final String? category;
  @JsonKey(name: "occasion")
  final String? occasion;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "id")
  final String? id;

  Products ({
    this.Id,
    this.title,
    this.slug,
    this.description,
    this.imgCover,
    this.images,
    this.price,
    this.priceAfterDiscount,
    this.quantity,
    this.category,
    this.occasion,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return _$ProductsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductsToJson(this);
  }
}


