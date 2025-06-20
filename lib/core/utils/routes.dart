import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:linkify_app/core/dependency_injection.dart';
import 'package:linkify_app/features/admin/data/repo_impl/admin_repo_impl.dart';
import 'package:linkify_app/features/admin/presentation/view/admin_add_product.dart';
import 'package:linkify_app/features/admin/presentation/view/admin_delete_product.dart';
import 'package:linkify_app/features/admin/presentation/view/admin_get_product.dart';
import 'package:linkify_app/features/admin/presentation/view/admin_get_report.dart';
import 'package:linkify_app/features/admin/presentation/view/admin_home.dart';
import 'package:linkify_app/features/admin/presentation/view/admin_select_brand.dart';
import 'package:linkify_app/features/admin/presentation/view/admin_update_product.dart';
import 'package:linkify_app/features/admin/presentation/view/widgets/admin_update_product_screen.dart';
import 'package:linkify_app/features/admin/presentation/view_model/admin_get_report_cubit/admin_get_report_cubit.dart';
import 'package:linkify_app/features/auth/presentation/view/confirm_email.dart';
import 'package:linkify_app/features/auth/presentation/view/forget_password.dart';
import 'package:linkify_app/features/auth/presentation/view/login.dart';
import 'package:linkify_app/features/auth/presentation/view/reset_password.dart';
import 'package:linkify_app/features/auth/presentation/view/sign_up.dart';
import 'package:linkify_app/features/cart/prasentation/view/cart_screen.dart';
import 'package:linkify_app/features/home/data/model/get_all_products_by_category_id/GetAllProductsByCategoryIdData.dart';
import 'package:linkify_app/features/home/data/model/search_model/SearchResponse.dart';
import 'package:linkify_app/features/home/presentation/view/home.dart';
import 'package:linkify_app/features/home/presentation/view/home_screen/widgets/search_result.dart';
import 'package:linkify_app/features/home/presentation/view/profile_screen/profile_screen.dart';
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
  static const String kAdmin = "/amin";
  static const String kAdminHome = "/adminHome";
  static const String kAdminAddProduct = "/adminAddProduct";
  static const String kAdminDeleteProduct = "/adminDeleteProduct";
  static const String kAdminGetProduct = "/adminGetProduct";
  static const String kAdminUpdateProduct = "/adminUpdateProduct";
  static const String kAdminUpdateProductScreen = "/adminUpdateProductScreen";
  static const String kAdminGetReport = "/adminGetReport";
  static const String kProfile = "/adminProfile";
  static const String kSearchResult = "/SearchResult";
  static GoRouter route = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          final String? role = PrefsHelper.getString(key: PrefsKey.role);
          if (PrefsHelper.getToken(key: PrefsKey.token) == null) {
            return const Splash();
          } else {
            return role == "admin" ? const AdminSelectHome() : const Home();
          }
        },
      ),
      GoRoute(
        path: kOnboarding,
        builder: (context, state) => const Onboarding(),
      ),
      GoRoute(
        path: kAdminHome,
        builder: (context, state) {
          final String brandId = state.extra as String;
          return AdminHome(
            brandId: brandId,
          );
        },
      ),
      GoRoute(
        path: kSignUp,
        builder: (context, state) => const SignUp(),
      ),
      GoRoute(
        path: kAdminAddProduct,
        builder: (context, state) {
          final String brandId = state.extra as String;
          return AdminAddProduct(
            brandId: brandId,
          );
        },
      ),
      GoRoute(
        path: kAdminUpdateProduct,
        builder: (context, state) {
          final String brandId = state.extra as String;
          return AdminUpdateProduct(
            brandId: brandId,
          );
        },
      ),
      GoRoute(
        path: kAdminGetProduct,
        builder: (context, state) {
          final String brandId = state.extra as String;
          return AdminGetProduct(
            brandId: brandId,
          );
        },
      ),
      GoRoute(
        path: kAdminGetReport,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              AdminGetReportCubit(adminRepo: getIt.get<AdminRepoImpl>())
                ..getReport(
                  token: PrefsHelper.getToken(key: PrefsKey.token),
                ),
          child: AdminGetReport(),
        ),
      ),
      GoRoute(
        path: kAdminDeleteProduct,
        builder: (context, state) {
          final String brandId = state.extra as String;
          return AdminDeleteProduct(
            brandId: brandId,
          );
        },
      ),
      GoRoute(
        path: kConfirmEmail,
        builder: (context, state) => const ConfirmEmail(),
      ),
      GoRoute(
        path: kProfile,
        builder: (context, state) => ProfileScreen(),
      ),
      GoRoute(
        path: kAdminUpdateProductScreen,
        builder: (context, state) {
          final GetAllProductsByCategoryIdData productData =
              state.extra as GetAllProductsByCategoryIdData;
          return AdminUpdateProductScreen(
            productsData: productData,
          );
        },
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
        path: kAdmin,
        builder: (context, state) => AdminSelectHome(),
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
          return Order(
            orderId: orderId,
          );
        },
      ),
      GoRoute(
        path: kSearchResult,
        builder: (context, state) {
          final SearchResponse searchResponse = state.extra as SearchResponse;
          return SearchResult(searchResponse: searchResponse);
        },
      ),
    ],
  );
}
