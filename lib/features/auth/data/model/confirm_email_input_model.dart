class ConfirmEmailInputModel {
  final String email;
  final String otp;

  ConfirmEmailInputModel({
    required this.email,
    required this.otp,
  });

  Map<String, dynamic> toJson() {
    return {
      "otp": otp,
      "email": email,
    };
  }
}
