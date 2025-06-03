import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkify_app/core/utils/styles_manager.dart';
import 'package:linkify_app/features/home/data/model/get_categories_by_brand_id/GetCategoriesByBrandData.dart';
import 'package:linkify_app/features/home/presentation/view_model/change_brand_screen_body/change_brand_screen_body_cubit.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_all_products_by_category_id/get_all_products_by_category_id_cubit.dart';

class CategoriesListViewItem extends StatelessWidget {
  const CategoriesListViewItem({
    super.key,
    required this.categoriesByBrandData,
  });

  final GetCategoriesByBrandData categoriesByBrandData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<ChangeBrandScreenBodyCubit>().changeIndex(newIndex: 1);
        context
            .read<GetAllProductsByCategoryIdCubit>()
            .getAllProductsByCategoryId(
                categoryId: categoriesByBrandData.id ?? "");
      },
      child: Container(
        width: 50.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: Colors.blue.shade100,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              textAlign: TextAlign.center,
              categoriesByBrandData.name ?? '',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: Styles.textStyle14.copyWith(
                color: Colors.blue.shade900,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
