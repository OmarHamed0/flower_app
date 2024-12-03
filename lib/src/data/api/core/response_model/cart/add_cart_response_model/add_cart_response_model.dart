import 'package:json_annotation/json_annotation.dart';

part 'add_cart_response_model.g.dart';

@JsonSerializable()
class AddCartResponseModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "numOfCartItems")
  final int? numOfCartItems;
  @JsonKey(name: "cart")
  final Cart? cart;

  AddCartResponseModel ({
    this.message,
    this.numOfCartItems,
    this.cart,
  });

  factory AddCartResponseModel.fromJson(Map<String, dynamic> json) {
    return _$AddCartResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddCartResponseModelToJson(this);
  }
}

@JsonSerializable()
class Cart {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "user")
  final String? user;
  @JsonKey(name: "cartItems")
  final List<CartItems>? cartItems;
  @JsonKey(name: "totalPrice")
  final int? totalPrice;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? _V;

  Cart ({
    this.Id,
    this.user,
    this.cartItems,
    this.totalPrice,
    this.createdAt,
    this.updatedAt,
    this._V,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return _$CartFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CartToJson(this);
  }
}

@JsonSerializable()
class CartItems {
  @JsonKey(name: "product")
  final String? product;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "_id")
  final String? Id;

  CartItems ({
    this.product,
    this.price,
    this.quantity,
    this.Id,
  });

  factory CartItems.fromJson(Map<String, dynamic> json) {
    return _$CartItemsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CartItemsToJson(this);
  }
}


