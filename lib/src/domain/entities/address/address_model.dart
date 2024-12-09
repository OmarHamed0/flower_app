import 'package:flower_app/src/data/models/address/address_request_dto.dart';

class AddressModel {
  final String? street;
  final String? phone;
  final String? city;
  final String? id;

  AddressModel({
    this.street,
    this.phone,
    this.city,
    this.id,
  });

  AddressRequestDTO toDto() {
    return AddressRequestDTO(
      street: street!,
      city: city!,
      phone: phone!,
    );
  }
}
