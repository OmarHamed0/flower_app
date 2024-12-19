// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBaqgxCAf8rwQ0VzJb1ttkz02YlNC_0Ha4',
    appId: '1:334921212661:android:11caaef907a4e0be34dbbc',
    messagingSenderId: '334921212661',
    projectId: 'elevate-ecom',
    storageBucket: 'elevate-ecom.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCIoYIHLllZoDkq9ev6zHaAM-aeVRXOzLg',
    appId: '1:334921212661:ios:da630c5dab28464734dbbc',
    messagingSenderId: '334921212661',
    projectId: 'elevate-ecom',
    storageBucket: 'elevate-ecom.firebasestorage.app',
    iosBundleId: 'com.example.flowerApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCIoYIHLllZoDkq9ev6zHaAM-aeVRXOzLg',
    appId: '1:334921212661:ios:da630c5dab28464734dbbc',
    messagingSenderId: '334921212661',
    projectId: 'elevate-ecom',
    storageBucket: 'elevate-ecom.firebasestorage.app',
    iosBundleId: 'com.example.flowerApp',
  );

}