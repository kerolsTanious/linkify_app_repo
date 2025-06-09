import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:linkify_app/core/utils/routes.dart';
import 'package:linkify_app/core/utils/styles_manager.dart';
import 'package:linkify_app/features/admin/presentation/view/widgets/admin_home_body_list_view_item.dart';

class AdminHomeBody extends StatelessWidget {
  const AdminHomeBody({super.key, required this.brandId});

  final String brandId;

  @override
  Widget build(BuildContext context) {
    final List<FeatureItem> features = [
      FeatureItem(
        "إضافة منتج",
        Icons.add_box_outlined,
        [Colors.blue, Colors.lightBlueAccent],
        () => context.push(RoutesManager.kAdminAddProduct, extra: brandId),
      ),
      FeatureItem(
        "حذف منتج",
        Icons.delete_forever_outlined,
        [Colors.red, Colors.redAccent],
        () => context.push(RoutesManager.kAdminDeleteProduct, extra: brandId),
      ),
      FeatureItem(
        "تحديث منتج",
        Icons.update_outlined,
        [Colors.orange, Colors.deepOrangeAccent],
        () => context.push(RoutesManager.kAdminUpdateProduct, extra: brandId),
      ),
      FeatureItem(
        "عرض المنتجات",
        Icons.view_list_outlined,
        [Colors.green, Colors.lightGreen],
        () => context.push(RoutesManager.kAdminGetProduct, extra: brandId),
      ),
      FeatureItem(
        "تقرير الطلبات",
        Icons.analytics_outlined,
        [Colors.purple, Colors.deepPurpleAccent],
        () => context.push(RoutesManager.kAdminGetReport),
      ),
    ];
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 60.h,
            child: Center(
              child: Text(
                "مرحبا بك نتمنى لك يوما موفقا",
                style: Styles.textStyle24,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: ListView.builder(
              padding: REdgeInsets.all(20),
              itemCount: features.length,
              itemBuilder: (context, index) {
                final feature = features[index];
                return AdminHomeBodyListViewItem(
                  feature: feature,
                  onTap: feature.onTap,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class FeatureItem {
  final String title;
  final IconData icon;
  final List<Color> colors;
  final void Function() onTap;

  FeatureItem(this.title, this.icon, this.colors, this.onTap);
}
