import 'package:flutter/material.dart';
import 'package:linkify_app/features/auth/presentation/view/widgets/confirm_email_body.dart';

class ConfirmEmail extends StatelessWidget {
  const ConfirmEmail({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ConfirmEmailBody(
          email: email,
        ),
      ),
    );
  }
}
