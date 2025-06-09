import 'package:flutter/material.dart';
import 'package:linkify_app/core/utils/color_manager.dart';
import 'package:linkify_app/features/admin/presentation/view/widgets/admin_update_product_body.dart';

class AdminUpdateProduct extends StatelessWidget {
  const AdminUpdateProduct({super.key, required this.brandId});

  final String brandId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.mainColor,
        body: AdminUpdateProductBody(brandId: brandId,),
      ),
    );
  }
}
