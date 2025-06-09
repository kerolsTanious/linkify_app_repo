import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkify_app/core/dependency_injection.dart';
import 'package:linkify_app/core/utils/color_manager.dart';
import 'package:linkify_app/features/admin/data/repo_impl/admin_repo_impl.dart';
import 'package:linkify_app/features/admin/presentation/view/widgets/admin_delete_product_body.dart';
import 'package:linkify_app/features/admin/presentation/view_model/admin_delete_product_cubit/admin_delete_product_cubit.dart';

class AdminDeleteProduct extends StatelessWidget {
  const AdminDeleteProduct({super.key, required this.brandId});

  final String brandId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.mainColor,
        body: BlocProvider(
          create: (context) =>
              AdminDeleteProductCubit(adminRepo: getIt.get<AdminRepoImpl>()),
          child: AdminDeleteProductBody(
            brandId: brandId,
          ),
        ),
      ),
    );
  }
}
