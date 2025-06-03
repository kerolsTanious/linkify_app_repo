import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkify_app/core/reusable_components/custom_app_bar.dart';
import 'package:linkify_app/features/home/presentation/view/brands_screen/widgets/brands_list_view.dart';
import 'package:linkify_app/features/home/presentation/view/brands_screen/widgets/categories_list_view.dart';
import 'package:linkify_app/features/home/presentation/view/brands_screen/widgets/custom_category_title.dart';

class BrandsScreenBody extends StatelessWidget {
  const BrandsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(),
        Expanded(
          child: Row(
            children: [
              BrandsListView(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomCategoryTitle(),
                    SizedBox(height: 20.h),
                    Expanded(child: CategoryListView()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
