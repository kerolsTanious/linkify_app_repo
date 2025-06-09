import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkify_app/core/dependency_injection.dart';
import 'package:linkify_app/core/utils/color_manager.dart';
import 'package:linkify_app/features/admin/data/repo_impl/admin_repo_impl.dart';
import 'package:linkify_app/features/admin/presentation/view/widgets/admin_update_product_screen_body.dart';
import 'package:linkify_app/features/admin/presentation/view_model/admin_update_product_cubit/admin_update_product_cubit.dart';
import 'package:linkify_app/features/home/data/model/get_all_products_by_category_id/GetAllProductsByCategoryIdData.dart';

class AdminUpdateProductScreen extends StatelessWidget {
  const AdminUpdateProductScreen({
    super.key,
    required this.productsData,
  });

  final GetAllProductsByCategoryIdData productsData;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.mainColor,
        body: BlocProvider(
          create: (context) =>
              AdminUpdateProductCubit(adminRepo: getIt.get<AdminRepoImpl>()),
          child: AdminUpdateProductScreenBody(
            productsData: productsData,
          ),
        ),
      ),
    );
  }
}
