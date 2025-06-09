import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:linkify_app/core/api/api_manager.dart';
import 'package:linkify_app/core/stripe/stripe_manager.dart';
import 'package:linkify_app/features/admin/data/repo_impl/admin_repo_impl.dart';
import 'package:linkify_app/features/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:linkify_app/features/cart/data/repo_impl/cart_repo_impl.dart';
import 'package:linkify_app/features/home/data/repo_impl/home_repo_impl.dart';
import 'package:linkify_app/features/payment/data/repo_impl/payment_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiManager>(
    ApiManager(dio: Dio()),
  );
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(
      apiManager: getIt.get<ApiManager>(),
    ),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      apiManager: getIt.get<ApiManager>(),
    ),
  );
  getIt.registerSingleton<CartRepoImpl>(
    CartRepoImpl(
      apiManager: getIt.get<ApiManager>(),
    ),
  );
  getIt.registerSingleton<PaymentRepoImpl>(
    PaymentRepoImpl(
      apiManager: getIt.get<ApiManager>(),
      stripeManager: StripeManager(apiManager: getIt.get<ApiManager>()),
    ),
  );
  getIt.registerSingleton<AdminRepoImpl>(
    AdminRepoImpl(
      apiManager: getIt.get<ApiManager>(),
    ),
  );
}
