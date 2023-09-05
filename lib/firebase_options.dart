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
    apiKey: 'AIzaSyDLvOAEU58AfkE5-0tcra8KfGcM_hoDDzM',
    appId: '1:210382666779:web:5594e59a2941c017b8ccbe',
    messagingSenderId: '210382666779',
    projectId: 'recetia-v2',
    authDomain: 'recetia-v2.firebaseapp.com',
    databaseURL: 'https://recetia-v2-default-rtdb.firebaseio.com',
    storageBucket: 'recetia-v2.appspot.com',
    measurementId: 'G-3707S6EP1C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAnaLLx2R-8zjNAvtG2ESlCb7l0TxuhExk',
    appId: '1:210382666779:android:170d7adaefdc2cd3b8ccbe',
    messagingSenderId: '210382666779',
    projectId: 'recetia-v2',
    databaseURL: 'https://recetia-v2-default-rtdb.firebaseio.com',
    storageBucket: 'recetia-v2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAYjvHSLMcu9wnIQ4plsQExxXOHqcl9sxA',
    appId: '1:210382666779:ios:db8d97b6b7e26234b8ccbe',
    messagingSenderId: '210382666779',
    projectId: 'recetia-v2',
    databaseURL: 'https://recetia-v2-default-rtdb.firebaseio.com',
    storageBucket: 'recetia-v2.appspot.com',
    iosClientId: '210382666779-jeamehs73rp16upcftos35fi4c8ec5o5.apps.googleusercontent.com',
    iosBundleId: 'com.example.recetIav2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAYjvHSLMcu9wnIQ4plsQExxXOHqcl9sxA',
    appId: '1:210382666779:ios:db8d97b6b7e26234b8ccbe',
    messagingSenderId: '210382666779',
    projectId: 'recetia-v2',
    databaseURL: 'https://recetia-v2-default-rtdb.firebaseio.com',
    storageBucket: 'recetia-v2.appspot.com',
    iosClientId: '210382666779-jeamehs73rp16upcftos35fi4c8ec5o5.apps.googleusercontent.com',
    iosBundleId: 'com.example.recetIav2',
  );
}