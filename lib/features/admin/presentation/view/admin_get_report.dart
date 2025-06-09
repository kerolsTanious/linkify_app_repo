import 'package:flutter/material.dart';
import 'package:linkify_app/features/admin/presentation/view/widgets/admin_get_report_body.dart';

class AdminGetReport extends StatelessWidget {
  const AdminGetReport({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AdminGetReportBody(),
      ),
    );
  }
}
