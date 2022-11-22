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
    apiKey: 'AIzaSyBbY4ljodTTWOFal0XLBl0fFYVZbUMywP8',
    appId: '1:748404535963:web:29721fe8561131010a0c3e',
    messagingSenderId: '748404535963',
    projectId: 'c-flutter-chat',
    authDomain: 'c-flutter-chat.firebaseapp.com',
    storageBucket: 'c-flutter-chat.appspot.com',
    measurementId: 'G-G045RF5CEB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBNIbNZmwWVEEqLCzQ92bG2zr5QfgELiXg',
    appId: '1:748404535963:android:2becdad9c30710b80a0c3e',
    messagingSenderId: '748404535963',
    projectId: 'c-flutter-chat',
    storageBucket: 'c-flutter-chat.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCE4ftagV4uHlSV0fqEAcexQrfj0DENpio',
    appId: '1:748404535963:ios:dcccf8a94d2094f20a0c3e',
    messagingSenderId: '748404535963',
    projectId: 'c-flutter-chat',
    storageBucket: 'c-flutter-chat.appspot.com',
    iosClientId: '748404535963-igpki1eriodkfpvf8jpnprselhdg1bg9.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterChatCasa',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCE4ftagV4uHlSV0fqEAcexQrfj0DENpio',
    appId: '1:748404535963:ios:dcccf8a94d2094f20a0c3e',
    messagingSenderId: '748404535963',
    projectId: 'c-flutter-chat',
    storageBucket: 'c-flutter-chat.appspot.com',
    iosClientId: '748404535963-igpki1eriodkfpvf8jpnprselhdg1bg9.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterChatCasa',
  );
}
