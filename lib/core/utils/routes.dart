import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:linkify_app/core/dependency_injection.dart';
import 'package:linkify_app/features/auth/presentation/view/confirm_email.dart';
import 'package:linkify_app/features/auth/presentation/view/forget_password.dart';
import 'package:linkify_app/features/auth/presentation/view/login.dart';
import 'package:linkify_app/features/auth/presentation/view/reset_password.dart';
import 'package:linkify_app/features/auth/presentation/view/sign_up.dart';
import 'package:linkify_app/features/cart/prasentation/view/cart_screen.dart';
import 'package:linkify_app/features/home/presentation/view/home.dart';
import 'package:linkify_app/features/on_boarding/presentation/view/onboarding.dart';
import 'package:linkify_app/features/payment/presentation/view/address.dart';
import 'package:linkify_app/features/splash/presentation/view/splash.dart';

import '../../features/payment/data/repo_impl/payment_repo_impl.dart';
import '../../features/payment/presentation/view/order.dart';
import '../../features/payment/presentation/view_model/save_address_cubit/save_address_cubit.dart';
import '../prefs.dart';

abstract class RoutesManager {
  static const String kOnboarding = "/onboarding";
  static const String kSignUp = "/signUp";
  static const String kConfirmEmail = "/confirmEmail";
  static const String kLogin = "/login";
  static const String kHome = "/home";
  static const String kForgetPassword = "/forgetPassword";
  static const String kResetPassword = "/resetPassword";
  static const String kCartScreen = "/cart";
  static const String kAddressScreen = "/address";
  static const String kOrderScreen = "/order";
  static GoRouter route = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>
            PrefsHelper.getToken(key: PrefsKey.token) == null
                ? Splash()
                : Home(),
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
        builder: (context, state) => const ConfirmEmail(),
      ),
      GoRoute(
        path: kLogin,
        builder: (context, state) => const Login(),
      ),
      GoRoute(
        path: kHome,
        builder: (context, state) => const Home(),
      ),
      GoRoute(
        path: kForgetPassword,
        builder: (context, state) => const ForgetPassword(),
      ),
      GoRoute(
        path: kResetPassword,
        builder: (context, state) => const ResetPassword(),
      ),
      GoRoute(
        path: kCartScreen,
        builder: (context, state) => CartScreen(),
      ),
      GoRoute(
        path: kAddressScreen,
        builder: (context, state) {
          final String cartId = state.extra as String;
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => SaveAddressCubit(
                  paymentRepo: getIt.get<PaymentRepoImpl>(),
                ),
              ),
            ],
            child: Address(
              cartId: cartId,
            ),
          );
        },
      ),
      GoRoute(
        path: kOrderScreen,
        builder: (context, state) {
          final String orderId = state.extra as String;
          return Order(orderId: orderId,);
        },
      ),
    ],
  );
}
