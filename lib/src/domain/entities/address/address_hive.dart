import 'package:flower_app/src/domain/entities/address/address_model.dart';
import 'package:hive/hive.dart';

part 'address_hive.g.dart';

@HiveType(typeId: 8)
class AddressHive {
  @HiveField(0)
  final String? street;
  @HiveField(1)
  final String? phone;
  @HiveField(2)
  final String? city;
  @HiveField(3)
  final String? id;

  AddressHive({
    this.street,
    this.phone,
    this.city,
    this.id,
  });

  AddressModel toModel() {
    return AddressModel(
      street: street,
      phone: phone,
      city: city,
      id: id,
    );
  }
}
