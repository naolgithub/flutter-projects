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
    apiKey: 'AIzaSyDTvTA9XK7jwKS9OcAWAn9zMs5x63pMHVc',
    appId: '1:740724783369:web:31f63672d86692f4cb3bd8',
    messagingSenderId: '740724783369',
    projectId: 'cattle-herding-with-geofencing',
    authDomain: 'cattle-herding-with-geofencing.firebaseapp.com',
    storageBucket: 'cattle-herding-with-geofencing.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAwZAOVlBWk_8_1__R_RN0TkG6eKKtKhdk',
    appId: '1:740724783369:android:82d0be646a1c428bcb3bd8',
    messagingSenderId: '740724783369',
    projectId: 'cattle-herding-with-geofencing',
    storageBucket: 'cattle-herding-with-geofencing.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB4rJXY2MwgEQoaoCCEZ8BDCRQGJLJJi5A',
    appId: '1:740724783369:ios:70c7f86434950dcdcb3bd8',
    messagingSenderId: '740724783369',
    projectId: 'cattle-herding-with-geofencing',
    storageBucket: 'cattle-herding-with-geofencing.appspot.com',
    iosClientId: '740724783369-ur9n3g3kdnkup1v1h03ra8hftmm6qdnt.apps.googleusercontent.com',
    iosBundleId: 'com.example.cattleHerdingWithGeofencing',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB4rJXY2MwgEQoaoCCEZ8BDCRQGJLJJi5A',
    appId: '1:740724783369:ios:fadad253a61ef354cb3bd8',
    messagingSenderId: '740724783369',
    projectId: 'cattle-herding-with-geofencing',
    storageBucket: 'cattle-herding-with-geofencing.appspot.com',
    iosClientId: '740724783369-6qhr8hin82jaru4fjkjg72osr3e30lgg.apps.googleusercontent.com',
    iosBundleId: 'com.example.cattleHerdingWithGeofencing.RunnerTests',
  );
}