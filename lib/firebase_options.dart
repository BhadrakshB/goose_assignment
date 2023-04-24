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
    apiKey: 'AIzaSyBSGTOjrq_Q_-JpIHLJxkoY745Ne6kLxYQ',
    appId: '1:1002551329932:web:cc9f80915ff4a75c7ee7a9',
    messagingSenderId: '1002551329932',
    projectId: 'awesome-marketplace',
    authDomain: 'awesome-marketplace.firebaseapp.com',
    storageBucket: 'awesome-marketplace.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBpAJK_Ikt5Py9hfiXnuPCXaj8LO9jFLE0',
    appId: '1:1002551329932:android:7304d7acb5cb5db87ee7a9',
    messagingSenderId: '1002551329932',
    projectId: 'awesome-marketplace',
    storageBucket: 'awesome-marketplace.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC-7qnj_3vXrSVbWxk5G0J5BgLILokWkZI',
    appId: '1:1002551329932:ios:3401db93ffad17f77ee7a9',
    messagingSenderId: '1002551329932',
    projectId: 'awesome-marketplace',
    storageBucket: 'awesome-marketplace.appspot.com',
    androidClientId: '1002551329932-jdknq2nh6qo2cpbi072lgk1crkjdivef.apps.googleusercontent.com',
    iosClientId: '1002551329932-nlihhp8239fj4247ur4c77omkknjnjip.apps.googleusercontent.com',
    iosBundleId: 'com.example.gooseFlutterAssignment',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC-7qnj_3vXrSVbWxk5G0J5BgLILokWkZI',
    appId: '1:1002551329932:ios:3401db93ffad17f77ee7a9',
    messagingSenderId: '1002551329932',
    projectId: 'awesome-marketplace',
    storageBucket: 'awesome-marketplace.appspot.com',
    androidClientId: '1002551329932-jdknq2nh6qo2cpbi072lgk1crkjdivef.apps.googleusercontent.com',
    iosClientId: '1002551329932-nlihhp8239fj4247ur4c77omkknjnjip.apps.googleusercontent.com',
    iosBundleId: 'com.example.gooseFlutterAssignment',
  );
}
