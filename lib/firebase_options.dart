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
    apiKey: 'AIzaSyBRUazzKpY3eJxV-3tHHFUX1U44qnKObAU',
    appId: '1:325206134116:web:57b3eeef761a56e28e3e71',
    messagingSenderId: '325206134116',
    projectId: 'know-yourself-60f9b',
    authDomain: 'know-yourself-60f9b.firebaseapp.com',
    databaseURL: 'https://know-yourself-60f9b-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'know-yourself-60f9b.appspot.com',
    measurementId: 'G-8VDLPJN5K6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAkQ4UXWamKwCHizYmpGq14GSEHnZChhnc',
    appId: '1:325206134116:android:fc2e9a7c62a7e8218e3e71',
    messagingSenderId: '325206134116',
    projectId: 'know-yourself-60f9b',
    databaseURL: 'https://know-yourself-60f9b-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'know-yourself-60f9b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDapERcu33YQ7QZ2TD3feTyX3a5VEfrVlg',
    appId: '1:325206134116:ios:9a0a5e61f5e988c38e3e71',
    messagingSenderId: '325206134116',
    projectId: 'know-yourself-60f9b',
    databaseURL: 'https://know-yourself-60f9b-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'know-yourself-60f9b.appspot.com',
    androidClientId: '325206134116-q10oh895nch8al76i1uufhl0phav58ee.apps.googleusercontent.com',
    iosClientId: '325206134116-pmmjqnk6mua70addqsa58u73t22v9t5s.apps.googleusercontent.com',
    iosBundleId: 'com.knowyourself.beta',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDapERcu33YQ7QZ2TD3feTyX3a5VEfrVlg',
    appId: '1:325206134116:ios:6f16c7d8c3710e618e3e71',
    messagingSenderId: '325206134116',
    projectId: 'know-yourself-60f9b',
    databaseURL: 'https://know-yourself-60f9b-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'know-yourself-60f9b.appspot.com',
    androidClientId: '325206134116-q10oh895nch8al76i1uufhl0phav58ee.apps.googleusercontent.com',
    iosClientId: '325206134116-49k98kvr7624e09cop4t0vtfuk9tub66.apps.googleusercontent.com',
    iosBundleId: 'com.knowyourself.beta.RunnerTests',
  );
}
