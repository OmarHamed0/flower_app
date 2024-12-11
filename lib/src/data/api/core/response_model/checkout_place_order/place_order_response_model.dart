import 'package:json_annotation/json_annotation.dart';

part 'place_order_response_model.g.dart';

@JsonSerializable()
class PlaceOrderResponseModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "order")
  final Order? order;

  PlaceOrderResponseModel ({
    this.message,
    this.order,
  });

  factory PlaceOrderResponseModel.fromJson(Map<String, dynamic> json) {
    return _$PlaceOrderResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PlaceOrderResponseModelToJson(this);
  }
}

@JsonSerializable()
class Order {
  @JsonKey(name: "user")
  final String? user;
  @JsonKey(name: "orderItems")
  final List<OrderItems>? orderItems;
  @JsonKey(name: "totalPrice")
  final num? totalPrice;
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

  Order ({
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
}

@JsonSerializable()
class OrderItems {
  @JsonKey(name: "product")
  final String? product;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "_id")
  final String? Id;

  OrderItems ({
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
}


