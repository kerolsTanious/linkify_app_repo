class LoginInputModel {
  final String email;
  final String password;

  LoginInputModel({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      "password": password,
      "email": email,
    };
  }
}
