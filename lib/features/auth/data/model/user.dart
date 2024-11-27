class UserModel {
  final String fullName;
  final String uniEmail;
  final String password;
  final String level;

  UserModel(
      {required this.fullName,
      required this.uniEmail,
      required this.password,
      required this.level});

  Map<String, dynamic> toJson() {
    return {
      "name": fullName,
      "email": uniEmail,
      "password": password,
      "level": level,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullName: "name",
      uniEmail: 'email',
      password: "password",
      level: "level",
    );
  }
}
