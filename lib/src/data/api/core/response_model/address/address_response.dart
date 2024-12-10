import 'package:flower_app/src/data/models/address/address_response_dto.dart';
import 'package:json_annotation/json_annotation.dart';

import 'addresses.dart';

part 'address_response.g.dart';

@JsonSerializable()
class AddressResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "addresses")
  final List<Addresses>? addresses;

  AddressResponse({
    this.message,
    this.addresses,
  });

  factory AddressResponse.fromJson(Map<String, dynamic> json) {
    return _$AddressResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddressResponseToJson(this);
  }

  AddressResponseDto toDto() {
    return AddressResponseDto(
      message: message,
      addresses: addresses!.map((e) => e.toDto()).toList(),
    );
  }
}
