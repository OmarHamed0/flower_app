import 'package:flower_app/src/domain/entities/address/address_hive.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() async {
  getIt.init();
  getIt.registerSingletonAsync<Box<AddressHive>>(() async {
    return await Hive.openBox<AddressHive>('saved_address');
  });
  await getIt.allReady();
}
