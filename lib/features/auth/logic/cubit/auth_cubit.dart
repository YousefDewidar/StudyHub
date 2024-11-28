import 'package:computers/features/auth/data/repo/auth_repo.dart';
import 'package:computers/features/auth/logic/cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final AuthRepo _authRepo = AuthRepo();

  Future<void> createUser({
    required String email,
    required String password,
    required String name,
    required String level,
  }) async {
    emit(RegisterLoading());

    try {
      await _authRepo.createUser(
        email: email,
        password: password,
        name: name,
        level: level,
      );

      emit(RegisterSuccess());
    } on FirebaseAuthException {
      emit(RegisterFailuer());
    }
  }
}
