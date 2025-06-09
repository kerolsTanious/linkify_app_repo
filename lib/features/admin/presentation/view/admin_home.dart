import 'package:flutter/material.dart';
import 'package:linkify_app/features/admin/presentation/view/widgets/admin_home_body.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key, required this.brandId});

  final String brandId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: ColorManager.mainColor,
        body: AdminHomeBody(
          brandId: brandId,
        ),
      ),
    );
  }
}
