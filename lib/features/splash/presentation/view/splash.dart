import 'package:flutter/material.dart';
import 'package:linkify_app/features/splash/presentation/view/widgets/splash_screen_body.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Scaffold(
        body: SplashScreenBody(),
      ),
    );
  }
}
