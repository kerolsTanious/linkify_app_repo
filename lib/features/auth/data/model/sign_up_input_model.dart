class SignUpInputModel {
  final String email;
  final String name;
  final String password;
  final String confirmPassword;
  final String phone;

  SignUpInputModel(
    this.email,
    this.name,
    this.password,
    this.confirmPassword,
    this.phone,
  );

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "phone": phone,
      "username": name,
      "confirmationPassword": confirmPassword,
    };
  }
}
