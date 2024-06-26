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
    apiKey: 'AIzaSyANWdC-mBkR3T_7T_GRuCO861Fuh-_-Qks',
    appId: '1:214429591505:web:ecd3f95da819b3937622f0',
    messagingSenderId: '214429591505',
    projectId: 'geminiapp-c36be',
    authDomain: 'geminiapp-c36be.firebaseapp.com',
    storageBucket: 'geminiapp-c36be.appspot.com',
    measurementId: 'G-CHLQG8J996',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBr_912D-fBoyVit7EWs27sK_CrISfft5M',
    appId: '1:214429591505:android:229740fc43c3fbe57622f0',
    messagingSenderId: '214429591505',
    projectId: 'geminiapp-c36be',
    storageBucket: 'geminiapp-c36be.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDxlmX6G6tnAjyJltysZ9RvJyoI8wWCvsU',
    appId: '1:214429591505:ios:67682810119325b57622f0',
    messagingSenderId: '214429591505',
    projectId: 'geminiapp-c36be',
    storageBucket: 'geminiapp-c36be.appspot.com',
    iosBundleId: 'com.example.geminiAiApp',
  );
}
