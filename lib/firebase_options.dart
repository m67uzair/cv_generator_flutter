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
    apiKey: 'AIzaSyAulrHriaErpjdOzsSoPpAe6LXRPHNZ-y0',
    appId: '1:297014082522:web:4c8a44bb681acc1155dee3',
    messagingSenderId: '297014082522',
    projectId: 'cv-generator-18125',
    authDomain: 'cv-generator-18125.firebaseapp.com',
    storageBucket: 'cv-generator-18125.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBuAL9pX56BlxlVLbSI30m2ie2GqffcqF8',
    appId: '1:297014082522:android:ecfd433ff4e1493655dee3',
    messagingSenderId: '297014082522',
    projectId: 'cv-generator-18125',
    storageBucket: 'cv-generator-18125.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyApBQN35GqJUBn-ee32CpoGLBsbHoQ45tg',
    appId: '1:297014082522:ios:8050183a16d1bed855dee3',
    messagingSenderId: '297014082522',
    projectId: 'cv-generator-18125',
    storageBucket: 'cv-generator-18125.appspot.com',
    iosClientId:
        '297014082522-8b8ai7iilf679sou7h1fo2cts00gf874.apps.googleusercontent.com',
    iosBundleId: 'com.example.cvGenerator',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyApBQN35GqJUBn-ee32CpoGLBsbHoQ45tg',
    appId: '1:297014082522:ios:8050183a16d1bed855dee3',
    messagingSenderId: '297014082522',
    projectId: 'cv-generator-18125',
    storageBucket: 'cv-generator-18125.appspot.com',
    iosClientId:
        '297014082522-8b8ai7iilf679sou7h1fo2cts00gf874.apps.googleusercontent.com',
    iosBundleId: 'com.example.cvGenerator',
  );
}
