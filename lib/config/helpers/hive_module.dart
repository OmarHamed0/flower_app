import 'package:flower_app/src/domain/entities/address/address_hive.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../dependency_injection/di.dart';

@injectable
class HiveModule {
  Box<AddressHive> get addressBox => getIt<Box<AddressHive>>();

  /// Method to store a value in the correct box based on type
  Future<void> put<T>(String key, T value) async {
    final box = _getBoxByType<T>();
    await box.put(key, value);
  }

  /// Method to retrieve a value from the correct box based on type
  T? get<T>(String key) {
    final box = _getBoxByType<T>();
    return box.get(key);
  }

  /// Method to delete a value from the correct box based on type
  Future<void> delete<T>(String key) async {
    final box = _getBoxByType<T>();
    await box.delete(key);
  }

  /// Private method to get the correct box based on the type
  Box<T> _getBoxByType<T>() {
    if (T == AddressHive) {
      return addressBox as Box<T>;
    }
    throw Exception('No box defined for type $T');
  }
}
