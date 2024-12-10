import 'package:flower_app/src/data/models/address/address_request_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_address_request.g.dart';

@JsonSerializable()
class AddAddressRequest {
  @JsonKey(name: "street")
  final String? street;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "city")
  final String? city;

  AddAddressRequest({
    this.street,
    this.phone,
    this.city,
  });

  factory AddAddressRequest.fromJson(Map<String, dynamic> json) {
    return _$AddAddressRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddAddressRequestToJson(this);
  }

  AddressRequestDTO toDto() {
    return AddressRequestDTO(
      street: street!,
      city: city!,
      phone: phone!,
    );
  }
}
