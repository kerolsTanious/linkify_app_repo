class SignUpInputModel {
  final String email;
  final String name;
  final String password;
  final String confirmPassword;
  final String phone;
  final String role;

  SignUpInputModel(
    this.email,
    this.name,
    this.password,
    this.confirmPassword,
    this.phone,
    this.role,
  );

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "phone": phone,
      "username": name,
      "confirmationPassword": confirmPassword,
      "role": role
    };
  }
}
