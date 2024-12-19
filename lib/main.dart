import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flower_app/src/domain/entities/address/address_hive.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/services/firebase_cloud_messaging.dart';
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
  FirebaseCloudMessaging.getInstance().initializeFirebaseCloudMessaging();

  const fatalError = true;
  FlutterError.onError = (errorDetails) {
    if (fatalError) {
      // If you want to record a "fatal" exception
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
      // ignore: dead_code
    } else {
      // If you want to record a "non-fatal" exception
      FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    }
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    if (fatalError) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      // ignore: dead_code
    } else {
      FirebaseCrashlytics.instance.recordError(error, stack);
    }
    return true;
  };
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(const FlowerApp());
}
