import 'package:flower_app/src/data/models/address/address_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'addresses.g.dart';

@JsonSerializable()
class Addresses {
  @JsonKey(name: "street")
  final String? street;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "city")
  final String? city;
  @JsonKey(name: "_id")
  final String? Id;

  Addresses({
    this.street,
    this.phone,
    this.city,
    this.Id,
  });

  factory Addresses.fromJson(Map<String, dynamic> json) {
    return _$AddressesFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddressesToJson(this);
  }

  AddressesDto toDto() {
    return AddressesDto(
      street: street,
      phone: phone,
      city: city,
      Id: Id,
    );
  }
}
