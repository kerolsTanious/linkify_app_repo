import 'package:flutter/material.dart';

class FailureStateWidget extends StatelessWidget {
  const FailureStateWidget({super.key, required this.errorMessage});

  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Text(
      errorMessage,
      textAlign: TextAlign.center,
    );
  }
}
