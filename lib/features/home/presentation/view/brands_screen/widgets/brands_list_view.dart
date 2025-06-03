import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkify_app/core/reusable_components/failure_state_widget.dart';
import 'package:linkify_app/features/home/presentation/view/brands_screen/widgets/brands_list_view_item.dart';
import 'package:linkify_app/features/home/presentation/view_model/change_brand_title_cubit/change_brand_title_cubit.dart';
import 'package:linkify_app/features/home/presentation/view_model/change_brands_list_view_index/change_brand_list_view_index_cubit.dart';
import 'package:linkify_app/features/home/presentation/view_model/change_brands_list_view_index/change_brand_list_view_index_state.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_all_brands_cubit/get_all_brands_cubit.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_all_brands_cubit/get_all_brands_state.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_categories_by_brand_id/get_categories_brand_id_cubit.dart';

import '../../../../../../core/utils/color_manager.dart';

class BrandsListView extends StatelessWidget {
  const BrandsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllBrandsCubit, GetAllBrandsState>(
      builder: (context, state) {
        if (state is GetAllBrandsSuccess) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Container(
              height: 600.h,
              width: 140.w,
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorManager.mainColor.withOpacity(0.3),
                ),
                color: ColorManager.categoryBackgroundColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: BlocBuilder<ChangeBrandListViewIndexCubit,
                  ChangeBrandListViewIndexState>(
                builder: (context, currentState) {
                  if (currentState is ChangeBrandListViewIndexSuccess) {
                    return ListView.builder(
                      itemCount: state.allBrandsData.length,
                      itemBuilder: (context, index) {
                        return BrandsListViewItem(
                          brandsData: state.allBrandsData[index],
                          getCategoriesByBrandId: () {
                            context
                                .read<GetCategoriesBrandIdCubit>()
                                .getCategoriesByBrandId(
                                    brandId:
                                        state.allBrandsData[index].id ?? "");
                          },
                          onTapOnchangeCategoryTitle: () {
                            context
                                .read<ChangeBrandTitleCubit>()
                                .changeBrandName(
                                    newBrandName:
                                        state.allBrandsData[index].name ?? '');
                          },
                          onTapOnCategoryItem: () {
                            context
                                .read<ChangeBrandListViewIndexCubit>()
                                .changeIndex(newIndex: index);
                          },
                          isSelected:
                              index == currentState.newIndex ? true : false,
                        );
                      },
                    );
                  }
                  return ListView.builder(
                    itemCount: state.allBrandsData.length,
                    itemBuilder: (context, index) {
                      return BrandsListViewItem(
                        brandsData: state.allBrandsData[index],
                        getCategoriesByBrandId: () {
                          context
                              .read<GetCategoriesBrandIdCubit>()
                              .getCategoriesByBrandId(
                                  brandId: state.allBrandsData[index].id ?? "");
                        },
                        onTapOnchangeCategoryTitle: () {
                          context.read<ChangeBrandTitleCubit>().changeBrandName(
                              newBrandName:
                                  state.allBrandsData[index].name ?? 'جهينة');
                        },
                        onTapOnCategoryItem: () {
                          context
                              .read<ChangeBrandListViewIndexCubit>()
                              .changeIndex(newIndex: index);
                        },
                        isSelected: index == 0 ? true : false,
                      );
                    },
                  );
                },
              ),
            ),
          );
        } else if (state is GetAllBrandsFailure) {
          return FailureStateWidget(
            errorMessage: state.errorMessage,
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
