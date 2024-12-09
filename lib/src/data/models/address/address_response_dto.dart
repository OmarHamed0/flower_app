import 'package:flower_app/src/data/models/address/address_dto.dart';
import 'package:flower_app/src/domain/entities/address/address_model.dart';

class AddressResponseDto {
  final String? message;
  final List<AddressesDto>? addresses;

  AddressResponseDto({
    this.message,
    this.addresses,
  });

  factory AddressResponseDto.fromJson(Map<String, dynamic> json) {
    return AddressResponseDto(
      message: json["message"],
      addresses: (json["addresses"] as List)
          .map((e) => AddressesDto.fromJson(e))
          .toList(),
    );
  }

  toJson() {
    return {
      "message": message,
      "addresses": addresses?.map((e) => e.toJson()).toList(),
    };
  }

  List<AddressModel> toModel() {
    return addresses!.map((e) => e.toModel()).toList();
  }
}
