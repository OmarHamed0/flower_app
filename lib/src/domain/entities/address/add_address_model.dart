import 'package:flower_app/src/data/models/address/address_request_dto.dart';

class AddAddressModel {
  final String street;
  final String city;
  final String phone;

  AddAddressModel({
    required this.street,
    required this.city,
    required this.phone,
  });

  AddressRequestDTO toDto() {
    return AddressRequestDTO(
      street: street,
      city: city,
      phone: phone,
    );
  }
}
