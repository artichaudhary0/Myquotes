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
    apiKey: 'AIzaSyAXNFtWjvdh7NJRs0BjCZKbtFjpwtwH7oc',
    appId: '1:725668037952:web:e9cb748f73736a0e9326a5',
    messagingSenderId: '725668037952',
    projectId: 'quotes-f5aaa',
    authDomain: 'quotes-f5aaa.firebaseapp.com',
    storageBucket: 'quotes-f5aaa.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDxvwy6cGpJD7UgVrRJwmGPdK8N_O6_KBI',
    appId: '1:725668037952:android:e18b3d7c20f774789326a5',
    messagingSenderId: '725668037952',
    projectId: 'quotes-f5aaa',
    storageBucket: 'quotes-f5aaa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAEbYSihXDlVzEZ8lAR0a3ziuPst1C--Qo',
    appId: '1:725668037952:ios:807dee09bbfc8f3d9326a5',
    messagingSenderId: '725668037952',
    projectId: 'quotes-f5aaa',
    storageBucket: 'quotes-f5aaa.appspot.com',
    iosClientId:
        '725668037952-2s6lunbu8eg40l9ina750h7qekeijh11.apps.googleusercontent.com',
    iosBundleId: 'com.example.quotes',
  );
}
