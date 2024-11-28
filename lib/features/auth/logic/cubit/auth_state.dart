class AuthState {}

final class AuthInitial extends AuthState {}

final class RegisterSuccess extends AuthState {}

final class RegisterVaildate extends AuthState {}

final class RegisterFailuer extends AuthState {
  final String errorMsg;
  RegisterFailuer(this.errorMsg);
}

final class RegisterLoading extends AuthState {}
