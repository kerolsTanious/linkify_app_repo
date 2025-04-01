class ResetPasswordInputModel {
  final String password;
  final String otp;
  final String email;

  ResetPasswordInputModel({
    required this.password,
    required this.otp,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "otp": otp,
      "password": password,
    };
  }
}
