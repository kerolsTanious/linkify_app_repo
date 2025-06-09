import 'package:flutter/material.dart';
import 'package:linkify_app/features/on_boarding/presentation/view/widgets/onboarding_screen_body.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController pageController = PageController();

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: OnboardingScreenBody(
          pageController: pageController,
        ),
      ),
    );
  }
}
