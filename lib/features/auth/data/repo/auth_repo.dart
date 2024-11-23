import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo {
  static Future<void> register(emailCon, passwordCon) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailCon.text, password: passwordCon.text);
  }
}
