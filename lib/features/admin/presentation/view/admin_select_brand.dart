import 'package:flutter/material.dart';
import 'package:linkify_app/core/utils/color_manager.dart';
import 'package:linkify_app/features/admin/presentation/view/widgets/admin_select_brand_body.dart';

class AdminSelectHome extends StatelessWidget {
  const AdminSelectHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.mainColor,
        body: AdminSelectBrandBody(),
      ),
    );
  }
}

