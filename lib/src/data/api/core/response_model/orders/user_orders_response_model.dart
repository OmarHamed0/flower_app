import 'package:json_annotation/json_annotation.dart';

part 'user_orders_response_model.g.dart';

@JsonSerializable()
class UserOrderResponseModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "orders")
  final Orders? orders;

  UserOrderResponseModel ({
    this.message,
    this.orders,
  });

  factory UserOrderResponseModel.fromJson(Map<String, dynamic> json) {
    return _$UserOrderResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserOrderResponseModelToJson(this);
  }
}

@JsonSerializable()
class Orders {
  @JsonKey(name: "_id")
  final String? Id;
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
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  Orders ({
    this.Id,
    this.user,
    this.orderItems,
    this.totalPrice,
    this.paymentType,
    this.isPaid,
    this.isDelivered,
    this.createdAt,
    this.updatedAt,
  });

  factory Orders.fromJson(Map<String, dynamic> json) {
    return _$OrdersFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrdersToJson(this);
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


