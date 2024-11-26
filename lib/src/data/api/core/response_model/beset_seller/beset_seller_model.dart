import 'package:json_annotation/json_annotation.dart';

part 'beset_seller_model.g.dart';

@JsonSerializable()
class BesetSellerModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "bestSeller")
  final List<BestSeller>? bestSeller;

  BesetSellerModel ({
    this.message,
    this.bestSeller,
  });

  factory BesetSellerModel.fromJson(Map<String, dynamic> json) {
    return _$BesetSellerModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BesetSellerModelToJson(this);
  }
}

@JsonSerializable()
class BestSeller {
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

  BestSeller ({
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

  factory BestSeller.fromJson(Map<String, dynamic> json) {
    return _$BestSellerFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BestSellerToJson(this);
  }
}


