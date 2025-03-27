import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkify_app/core/utils/assets_manager.dart';
import 'package:linkify_app/core/utils/routes.dart';
import 'package:linkify_app/features/splash/presentation/view/widgets/animated_text.dart';
import 'package:go_router/go_router.dart';


class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  double screenHeight = WidgetsBinding
      .instance.platformDispatcher.views.first.physicalSize.height;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    slidingAnimation = Tween<Offset>(
      end: Offset.zero,
      begin: Offset(0, screenHeight / 500),
    ).animate(animationController);

    animationController.forward();

    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (mounted) {
          navToOnboardingScreen();
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          AssetsManager.splashLogoTrans,
          height: 200.h,
          width: 200.w,
        ),
        AnimatedText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  navToOnboardingScreen() async {
    context.push(RoutesManager.kOnboarding);
  }
}
