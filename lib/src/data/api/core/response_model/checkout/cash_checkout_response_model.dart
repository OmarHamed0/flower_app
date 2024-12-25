import 'package:json_annotation/json_annotation.dart';
import 'package:flower_app/src/domain/entities/checkout/cash_checkout_entity.dart';
part 'cash_checkout_response_model.g.dart';

@JsonSerializable()
class CashCheckoutResponseModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "order")
  final Order? order;

  CashCheckoutResponseModel({
    this.message,
    this.order,
  });

  factory CashCheckoutResponseModel.fromJson(Map<String, dynamic> json) {
    return _$CashCheckoutResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CashCheckoutResponseModelToJson(this);
  }

  CashCheckoutEntity toDomainDto() {
    return CashCheckoutEntity(
      message: this.message,
      order: this.order!.toDomainDto(),
    );
  }
}
@JsonSerializable()
class Order {
  @JsonKey(name: "user")
  final String? user;
  @JsonKey(name: "orderItems")
  final List<OrderItems>? orderItems;
  @JsonKey(name: "totalPrice")
  final int? totalPrice;
  @JsonKey(name: "paymentType")
  final String? paymentType;
  @JsonKey(name: "isPaid")
  final bool? isPaid;
  @JsonKey(name: "isDelivered")
  final bool? isDelivered;
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;

  Order({
    this.user,
    this.orderItems,
    this.totalPrice,
    this.paymentType,
    this.isPaid,
    this.isDelivered,
    this.Id,
    this.createdAt,
    this.updatedAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return _$OrderFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrderToJson(this);
  }

  OrderEntity toDomainDto() {
    return OrderEntity(
      user: this.user,
      orderItems: this.orderItems?.map((item) => item.toDomainDto()).toList(),
      totalPrice: this.totalPrice,
      paymentType: this.paymentType,
      isPaid: this.isPaid,
      isDelivered: this.isDelivered,
      id: this.Id,
      createdAt: this.createdAt,
      updatedAt: this.updatedAt,
    );
  }
}
@JsonSerializable()
class OrderItems {
  @JsonKey(name: "product")
  final Product? product;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "_id")
  final String? Id;

  OrderItems({
    this.product,
    this.price,
    this.quantity,
    this.Id,
  });

  factory OrderItems.fromJson(Map<String, dynamic> json) {
    return _$OrderItemsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrderItemsToJson(this);
  }

  // Method to convert to OrderItems entity
  OrderItemsEntity toDomainDto() {
    return OrderItemsEntity(
      product: this.product?.toDomainDto(),
      price: this.price,
      quantity: this.quantity,
      id: this.Id,
    );
  }
}
@JsonSerializable()
class Product {
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
  @JsonKey(name: "discount")
  final int? discount;
  @JsonKey(name: "sold")
  final int? sold;
  @JsonKey(name: "id")
  final String? id;

  Product({
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
    this.discount,
    this.sold,
    this.id,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductToJson(this);
  }

  // Method to convert to Product entity
  ProductEntity toDomainDto() {
    return ProductEntity(
      id_: this.Id,
      title: this.title,
      slug: this.slug,
      description: this.description,
      imgCover: this.imgCover,
      images: this.images,
      price: this.price,
      priceAfterDiscount: this.priceAfterDiscount,
      quantity: this.quantity,
      category: this.category,
      occasion: this.occasion,
      createdAt: this.createdAt,
      updatedAt: this.updatedAt,
      discount: this.discount,
      sold: this.sold,
      id: this.id,
    );
  }
}