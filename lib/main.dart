import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flower_app/src/domain/entities/address/address_hive.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/utils/bloc_observer/bloc_observer.dart';
import 'dependency_injection/di.dart';
import 'firebase_options.dart';
import 'flower_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(AddressHiveAdapter());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  configureDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(const FlowerApp());
}
