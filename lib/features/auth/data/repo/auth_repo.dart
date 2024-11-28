import 'package:computers/core/firebase/database.dart';
import 'package:computers/features/auth/data/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo {
  Future<void> createUser({
    required String email,
    required String password,
    required String name,
    required String level,

  }) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await Database.addUser(
      user: UserModel(
        fullName: name,
        uniEmail: email,
        password: password,
        level: level,
      ),
    );

  
  }
}
