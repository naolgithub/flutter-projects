// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
      return web;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCHLmdJAEA_gFr4j-9f3ryrMwaADSK8Zgw',
    appId: '1:860559570284:web:05fb0633e9fbb5a1eeaf49',
    messagingSenderId: '860559570284',
    projectId: 'castvotes-d0e16',
    authDomain: 'castvotes-d0e16.firebaseapp.com',
    storageBucket: 'castvotes-d0e16.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC2rjhOnWPZ3qrrumHSWI0QQJa6EMKW_jo',
    appId: '1:860559570284:android:687ee32ac03c4b76eeaf49',
    messagingSenderId: '860559570284',
    projectId: 'castvotes-d0e16',
    storageBucket: 'castvotes-d0e16.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBx60qk0PpjL1bqsMu_VW2cH9zfsUEkQ7k',
    appId: '1:860559570284:ios:c0f4e1419d2ad63feeaf49',
    messagingSenderId: '860559570284',
    projectId: 'castvotes-d0e16',
    storageBucket: 'castvotes-d0e16.appspot.com',
    iosClientId: '860559570284-mnq0omq0u3oi1uqakjup9nj553c8r2nc.apps.googleusercontent.com',
    iosBundleId: 'com.example.castvotes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBx60qk0PpjL1bqsMu_VW2cH9zfsUEkQ7k',
    appId: '1:860559570284:ios:c0f4e1419d2ad63feeaf49',
    messagingSenderId: '860559570284',
    projectId: 'castvotes-d0e16',
    storageBucket: 'castvotes-d0e16.appspot.com',
    iosClientId: '860559570284-mnq0omq0u3oi1uqakjup9nj553c8r2nc.apps.googleusercontent.com',
    iosBundleId: 'com.example.castvotes',
  );
}
