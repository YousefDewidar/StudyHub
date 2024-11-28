import 'package:firebase_auth/firebase_auth.dart';

class ErrorHandle {
  static String authHandle(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return 'This email is already in use.';

      case 'weak-password':
        return 'The password is not strong enough.';

      case 'invalid-email':
        return 'The email address is invalid.';

      default:
        return '';
    }
  }
}
