import 'package:json_annotation/json_annotation.dart';

part 'place_order_request_model.g.dart';

@JsonSerializable()
class PlaceOrderRequestModel {
  @JsonKey(name: "shippingAddress")
  final ShippingAddress? shippingAddress;

  PlaceOrderRequestModel ({
    this.shippingAddress,
  });

  factory PlaceOrderRequestModel.fromJson(Map<String, dynamic> json) {
    return _$PlaceOrderRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PlaceOrderRequestModelToJson(this);
  }
}

@JsonSerializable()
class ShippingAddress {
  @JsonKey(name: "street")
  final String? street;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "city")
  final String? city;

  ShippingAddress ({
    this.street,
    this.phone,
    this.city,
  });

  factory ShippingAddress.fromJson(Map<String, dynamic> json) {
    return _$ShippingAddressFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ShippingAddressToJson(this);
  }
}


