import 'package:go_router/go_router.dart';
import 'package:linkify_app/features/auth/presentation/view/confirm_email.dart';
import 'package:linkify_app/features/auth/presentation/view/login.dart';
import 'package:linkify_app/features/auth/presentation/view/sign_up.dart';
import 'package:linkify_app/features/on_boarding/presentation/view/onboarding.dart';
import 'package:linkify_app/features/splash/presentation/view/splash.dart';

abstract class RoutesManager {
  static const String kOnboarding = "/onboarding";
  static const String kSignUp = "/signUp";
  static const String kConfirmEmail = "/confirmEmail";
  static const String kLogin = "/login";
  static GoRouter route = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Splash(),
      ),
      GoRoute(
        path: kOnboarding,
        builder: (context, state) => const Onboarding(),
      ),
      GoRoute(
        path: kSignUp,
        builder: (context, state) => const SignUp(),
      ),
      GoRoute(
        path: kConfirmEmail,
        builder: (context, state) {
          final String email = state.extra as String;
          return ConfirmEmail(email: email);
        },
      ),
      GoRoute(
        path: kLogin,
        builder: (context, state) => const Login(),
      ),
    ],
  );
}
