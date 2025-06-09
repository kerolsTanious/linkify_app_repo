import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkify_app/core/utils/styles_manager.dart';
import 'package:linkify_app/features/admin/presentation/view/widgets/admin_home_body.dart';

class AdminHomeBodyListViewItem extends StatelessWidget {
  const AdminHomeBodyListViewItem({super.key, required this.feature, required this.onTap});

  final FeatureItem feature;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(bottom: 40),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(25.r),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: 100.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: feature.colors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                SizedBox(width: 25.w),
                Icon(feature.icon, color: Colors.white, size: 40.sp),
                SizedBox(width: 25.w),
                Text(
                  feature.title,
                  style: Styles.textStyle25.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
