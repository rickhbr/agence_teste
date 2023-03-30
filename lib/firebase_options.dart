import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyDZ2dcE_T-J19r188yYGVWN6ZxDgAi4x3Y',
    appId: '1:1054796557924:android:4bfa84fab57676a73d7971',
    messagingSenderId: '1054796557924',
    projectId: 'agence-teste-74034',
    storageBucket: 'agence-teste-74034.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA1cdlfIFjnJqqqSaANr0kID6hXIoDM3RI',
    appId: '1:1054796557924:ios:5b93e7cbda1ac8253d7971',
    messagingSenderId: '1054796557924',
    projectId: 'agence-teste-74034',
    storageBucket: 'agence-teste-74034.appspot.com',
    iosClientId:
        '1054796557924-2ahvqvt2pjvj85nt4ve5bd1d7ki8fk8g.apps.googleusercontent.com',
    iosBundleId: 'com.example.agenceTest',
  );
}
