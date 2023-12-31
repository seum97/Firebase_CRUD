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
    apiKey: 'AIzaSyC_dP55zIFzP2By37hkJOzLX_iBTVKwWPA',
    appId: '1:305940459879:web:dea515eb3906e828e2ffc2',
    messagingSenderId: '305940459879',
    projectId: 'firestore-crud-d8598',
    authDomain: 'firestore-crud-d8598.firebaseapp.com',
    storageBucket: 'firestore-crud-d8598.appspot.com',
    measurementId: 'G-D9LLXYRD2N',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAaCo8QI0kZW1EASZFWQ0mptPnkAIgOzuM',
    appId: '1:305940459879:android:4fec2bfbcb7c809ce2ffc2',
    messagingSenderId: '305940459879',
    projectId: 'firestore-crud-d8598',
    storageBucket: 'firestore-crud-d8598.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDZxqXp-t3DCiLcrsAxny_D4bskK6Pya6c',
    appId: '1:305940459879:ios:7ce9161e0dcaa36ce2ffc2',
    messagingSenderId: '305940459879',
    projectId: 'firestore-crud-d8598',
    storageBucket: 'firestore-crud-d8598.appspot.com',
    iosBundleId: 'com.example.firestoreCrud',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDZxqXp-t3DCiLcrsAxny_D4bskK6Pya6c',
    appId: '1:305940459879:ios:f6782a18e15806b7e2ffc2',
    messagingSenderId: '305940459879',
    projectId: 'firestore-crud-d8598',
    storageBucket: 'firestore-crud-d8598.appspot.com',
    iosBundleId: 'com.example.firestoreCrud.RunnerTests',
  );
}
