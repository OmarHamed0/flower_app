import 'package:flower_app/src/data/api/core/requestes_models/add_address_request.dart';
import 'package:flower_app/src/domain/entities/address/add_address_model.dart';

class AddressRequestDTO {
  AddressRequestDTO({
    required this.street,
    required this.city,
    required this.phone,
  });

  final String street;
  final String city;
  final String phone;

  AddAddressRequest toRequest() {
    return AddAddressRequest(
      street: street,
      city: city,
      phone: phone,
    );
  }

  AddAddressModel toModel() {
    return AddAddressModel(
      street: street,
      city: city,
      phone: phone,
    );
  }
}
