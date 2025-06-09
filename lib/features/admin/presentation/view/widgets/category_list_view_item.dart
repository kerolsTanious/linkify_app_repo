import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkify_app/features/home/data/model/get_categories_by_brand_id/GetCategoriesByBrandData.dart';

class CategoryListViewItem extends StatelessWidget {
  const CategoryListViewItem({
    super.key,
    required this.data,
    required this.index,
    required this.isSelected,
    required this.onTap,
  });

  final List<GetCategoriesByBrandData> data;
  final int index;
  final bool isSelected;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue : Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            data[index].name ?? "",
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
