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
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBjHDfPrOpmO9B9_pLSlDvUFnU08xqFm_Q',
    appId: '1:563962804135:web:a78f8c8d949eb883e0e882',
    messagingSenderId: '563962804135',
    projectId: 'example-477b8',
    authDomain: 'example-477b8.firebaseapp.com',
    storageBucket: 'example-477b8.appspot.com',
    measurementId: 'G-ZPQG8XRRK2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBqRy8hUMV2e4AWYCd_4Agay-Vof2x3JF0',
    appId: '1:563962804135:android:318446c6917d9319e0e882',
    messagingSenderId: '563962804135',
    projectId: 'example-477b8',
    storageBucket: 'example-477b8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA__sHcnBlYtxdNZTdibUjveHE9p6-JhPU',
    appId: '1:563962804135:ios:ee7d44c095b772d6e0e882',
    messagingSenderId: '563962804135',
    projectId: 'example-477b8',
    storageBucket: 'example-477b8.appspot.com',
    androidClientId: '563962804135-rcgvktkhkp3paopib94f2nmn262bfmlm.apps.googleusercontent.com',
    iosClientId: '563962804135-q76dmpg6n52m9ouudv5lhd7brfe8b70o.apps.googleusercontent.com',
    iosBundleId: 'com.longtn.exampler',
  );

}