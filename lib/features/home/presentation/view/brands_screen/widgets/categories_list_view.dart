import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkify_app/core/reusable_components/failure_state_widget.dart';
import 'package:linkify_app/features/home/presentation/view/brands_screen/widgets/categories_list_view_item.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_categories_by_brand_id/get_categories_brand_id_cubit.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_categories_by_brand_id/get_categories_brand_id_state.dart';

import '../../../view_model/get_categories_in_brand/get_categories_in_brand_cubit.dart';

class CategoryListView extends StatefulWidget {
  const CategoryListView({
    super.key,
  });

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (!context.read<GetCategoriesInBrandCubit>().selected) {
          context
              .read<GetCategoriesBrandIdCubit>()
              .getCategoriesByBrandId(brandId: "680a62029a4299c023d2cd67");
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoriesBrandIdCubit, GetCategoriesBrandIdState>(
      builder: (context, state) {
        if (state is GetCategoriesBrandIdSuccess) {
          return Container(
            width: double.infinity,
            height: 620.h,
            margin: EdgeInsets.only(right: 16.w),
            child: GridView.builder(
              itemCount: state.getCategoriesByBrandData.length,
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15.w,
                mainAxisSpacing: 15.h,
                childAspectRatio: 1.9.r,
              ),
              itemBuilder: (context, index) {
                return CategoriesListViewItem(
                  categoriesByBrandData: state.getCategoriesByBrandData[index],
                );
              },
            ),
          );
        } else if (state is GetCategoriesBrandIdFailure) {
          return FailureStateWidget(errorMessage: state.errorMessage);
        } else {
          return SizedBox();
        }
      },
    );
  }
}
