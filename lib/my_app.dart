import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkify_app/core/dependency_injection.dart';
import 'package:linkify_app/core/utils/routes.dart';
import 'package:linkify_app/features/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:linkify_app/features/auth/presentation/view_model/create_new_customer_cubit/create_new_customer_cubit.dart';
import 'package:linkify_app/features/cart/data/repo_impl/cart_repo_impl.dart';
import 'package:linkify_app/features/cart/prasentation/view_model/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:linkify_app/features/cart/prasentation/view_model/delete_item_from_cart_cubit/delete_item_from_cart_cubit.dart';
import 'package:linkify_app/features/home/data/repo_impl/home_repo_impl.dart';
import 'package:linkify_app/features/home/presentation/view_model/change_brand_title_cubit/change_brand_title_cubit.dart';
import 'package:linkify_app/features/home/presentation/view_model/change_brands_list_view_index/change_brand_list_view_index_cubit.dart';
import 'package:linkify_app/features/home/presentation/view_model/change_home_screen_body_cubit/change_home_screen_body_cubit.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_all_brands_cubit/get_all_brands_cubit.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_all_categories_cubit/get_all_categories_cubit.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_all_products_by_category_id/get_all_products_by_category_id_cubit.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_categories_by_brand_id/get_categories_brand_id_cubit.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_profile_cubit/get_profile_cubit.dart';
import 'package:linkify_app/features/home/presentation/view_model/update_profile_cubit/update_profile_cubit.dart';
import 'package:linkify_app/features/payment/presentation/view_model/get_order_details/get_order_details_cubit.dart';
import 'package:linkify_app/features/payment/presentation/view_model/payment_cubit/payment_cubit.dart';

import 'features/home/presentation/view_model/change_brand_screen_body/change_brand_screen_body_cubit.dart';
import 'features/home/presentation/view_model/get_categories_in_brand/get_categories_in_brand_cubit.dart';
import 'features/home/presentation/view_model/search_cubit/search_cubit.dart';
import 'features/payment/data/repo_impl/payment_repo_impl.dart';
import 'features/payment/presentation/view_model/create_order_cubit/create_order_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => GetAllCategoriesCubit(
                homeRepo: getIt.get<HomeRepoImpl>(),
              )..getAllCategories(),
            ),
            BlocProvider(
              create: (context) => GetAllBrandsCubit(
                homeRepo: getIt.get<HomeRepoImpl>(),
              )..getAllBrands(),
            ),
            BlocProvider(
              create: (context) => ChangeHomeScreenBodyCubit(),
            ),
            BlocProvider(
              create: (context) => GetAllProductsByCategoryIdCubit(
                  homeRepo: getIt.get<HomeRepoImpl>()),
            ),
            BlocProvider(
              create: (context) => ChangeBrandTitleCubit(),
            ),
            BlocProvider(
              create: (context) => ChangeBrandListViewIndexCubit(),
            ),
            BlocProvider(
              create: (context) => GetCategoriesBrandIdCubit(
                homeRepo: getIt.get<HomeRepoImpl>(),
              ),
            ),
            BlocProvider(
              create: (context) => GetCategoriesInBrandCubit(),
            ),
            BlocProvider(
              create: (context) => ChangeBrandScreenBodyCubit(),
            ),
            BlocProvider(
              create: (context) => AddToCartCubit(
                cartRepo: getIt.get<CartRepoImpl>(),
              ),
            ),
            BlocProvider(
              create: (context) => DeleteItemFromCartCubit(
                cartRepo: getIt.get<CartRepoImpl>(),
              ),
            ),
            BlocProvider(
              create: (context) => CreateOrderCubit(
                paymentRepo: getIt.get<PaymentRepoImpl>(),
              ),
            ),
            BlocProvider(
              create: (context) => CreateNewCustomerCubit(
                authRepo: getIt.get<AuthRepoImpl>(),
              ),
            ),
            BlocProvider(
              create: (context) => PaymentCubit(
                paymentRepo: getIt.get<PaymentRepoImpl>(),
              ),
            ),
            BlocProvider(
              create: (context) => GetOrderDetailsCubit(
                paymentRepo: getIt.get<PaymentRepoImpl>(),
              ),
            ),
            BlocProvider(
              create: (context) =>
                  GetProfileCubit(homeRepo: getIt.get<HomeRepoImpl>()),
            ),
            BlocProvider(
              create: (context) => UpdateProfileCubit(
                homeRepo: getIt.get<HomeRepoImpl>(),
              ),
            ),
            BlocProvider(
              create: (context) => SearchCubit(
                homeRepo: getIt.get<HomeRepoImpl>(),
              ),
            ),
          ],
          child: MaterialApp.router(
            routerConfig: RoutesManager.route,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ).copyWith(
              scaffoldBackgroundColor: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
