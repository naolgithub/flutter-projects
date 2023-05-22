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
    apiKey: 'AIzaSyD6-bNZ2704GlM2MsCliZdV_4_67fjuJ4o',
    appId: '1:30633808607:web:b0f856d09a233e619b0f6a',
    messagingSenderId: '30633808607',
    projectId: 'twitch-clone-a27e6',
    authDomain: 'twitch-clone-a27e6.firebaseapp.com',
    storageBucket: 'twitch-clone-a27e6.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB_jOCCE3-_FjGlEfIuu0g6hZfw8MSiC9c',
    appId: '1:30633808607:android:9c6654c6fc0e79d29b0f6a',
    messagingSenderId: '30633808607',
    projectId: 'twitch-clone-a27e6',
    storageBucket: 'twitch-clone-a27e6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAYK9Fsym9TLZd0XIVrIE5uigGI6sCEthY',
    appId: '1:30633808607:ios:ec4212c496883a649b0f6a',
    messagingSenderId: '30633808607',
    projectId: 'twitch-clone-a27e6',
    storageBucket: 'twitch-clone-a27e6.appspot.com',
    iosClientId: '30633808607-1nrlm580bvcns6m4855rgjol9hlu3f03.apps.googleusercontent.com',
    iosBundleId: 'com.example.twitchClone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAYK9Fsym9TLZd0XIVrIE5uigGI6sCEthY',
    appId: '1:30633808607:ios:7f5009ebae8087dd9b0f6a',
    messagingSenderId: '30633808607',
    projectId: 'twitch-clone-a27e6',
    storageBucket: 'twitch-clone-a27e6.appspot.com',
    iosClientId: '30633808607-fi685nj0ohlnjp80vq96elip67j5qds1.apps.googleusercontent.com',
    iosBundleId: 'com.example.twitchClone.RunnerTests',
  );
}