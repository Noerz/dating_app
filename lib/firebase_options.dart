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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBy-AE7wU07uIt13GgdUtEUJ6Iz2ZdUnR0',
    appId: '1:1072873599172:android:b615563ba9eb6098e19991',
    messagingSenderId: '1072873599172',
    projectId: 'dating-app-b040f',
    databaseURL: 'https://dating-app-b040f-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'dating-app-b040f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBLfj_Pes62OiSlrUaZbiIO62TXhb5PfTM',
    appId: '1:1072873599172:ios:8dcf6fc46bbef316e19991',
    messagingSenderId: '1072873599172',
    projectId: 'dating-app-b040f',
    databaseURL: 'https://dating-app-b040f-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'dating-app-b040f.appspot.com',
    androidClientId: '1072873599172-fjorvkm9ajeqcgshsqsb57c9of7j76ep.apps.googleusercontent.com',
    iosClientId: '1072873599172-ldrl1alj9i95mplem2smccrbfl1gqei5.apps.googleusercontent.com',
    iosBundleId: 'com.example.datingApp',
  );
}
