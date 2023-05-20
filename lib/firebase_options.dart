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
    apiKey: 'AIzaSyDgf1D1LCSzO2-Ns_SOuEjfD77mKoh6MVQ',
    appId: '1:42672807879:web:9705de05df450f561143e2',
    messagingSenderId: '42672807879',
    projectId: 'e-commerce-6ce19',
    authDomain: 'e-commerce-6ce19.firebaseapp.com',
    storageBucket: 'e-commerce-6ce19.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAr11HJjtWiZMeGkDit6HAwOhYhu7yBIME',
    appId: '1:42672807879:android:21f21346ce680f411143e2',
    messagingSenderId: '42672807879',
    projectId: 'e-commerce-6ce19',
    storageBucket: 'e-commerce-6ce19.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAZ4yp_R9dIXNW2xyemWkbj5FjG8yUARBQ',
    appId: '1:42672807879:ios:383c538c2672b7121143e2',
    messagingSenderId: '42672807879',
    projectId: 'e-commerce-6ce19',
    storageBucket: 'e-commerce-6ce19.appspot.com',
    iosClientId: '42672807879-pl3qt9vq9av2cr6ivvg5osbo3ud8sfb6.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerce3',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAZ4yp_R9dIXNW2xyemWkbj5FjG8yUARBQ',
    appId: '1:42672807879:ios:383c538c2672b7121143e2',
    messagingSenderId: '42672807879',
    projectId: 'e-commerce-6ce19',
    storageBucket: 'e-commerce-6ce19.appspot.com',
    iosClientId: '42672807879-pl3qt9vq9av2cr6ivvg5osbo3ud8sfb6.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerce3',
  );
}