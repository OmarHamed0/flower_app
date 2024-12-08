import 'package:flower_app/src/domain/entities/address/address_model.dart';

class AddressesDto {
  final String? street;
  final String? phone;
  final String? city;
  final String? Id;

  AddressesDto({
    this.street,
    this.phone,
    this.city,
    this.Id,
  });

  factory AddressesDto.fromJson(Map<String, dynamic> json) {
    return AddressesDto(
      street: json['street'],
      phone: json['phone'],
      city: json['city'],
      Id: json['_id'],
    );
  }
  toJson() {
    return {
      "street": street,
      "phone": phone,
      "city": city,
      "_id": Id,
    };
  }

  AddressModel toModel() {
    return AddressModel(
      street: street,
      phone: phone,
      city: city,
      id: Id,
    );
  }
}
