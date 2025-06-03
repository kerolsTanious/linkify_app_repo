import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkify_app/core/reusable_components/failure_state_widget.dart';
import 'package:linkify_app/features/home/presentation/view/home_screen/widgets/brand_list_view_item.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_all_brands_cubit/get_all_brands_cubit.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_all_brands_cubit/get_all_brands_state.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_categories_by_brand_id/get_categories_brand_id_cubit.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_categories_in_brand/get_categories_in_brand_cubit.dart';

import '../../../view_model/change_brand_title_cubit/change_brand_title_cubit.dart';
import '../../../view_model/change_brands_list_view_index/change_brand_list_view_index_cubit.dart';

class HomeScreenBodyListView extends StatelessWidget {
  const HomeScreenBodyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllBrandsCubit, GetAllBrandsState>(
      builder: (context, state) {
        if (state is GetAllBrandsSuccess) {
          return SizedBox(
            width: double.infinity,
            height: 144.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: state.allBrandsData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: HomeScreenBodyListViewItem(
                    allBrandsData: state.allBrandsData[index],
                    changeSelectedBool: () {
                      context
                          .read<GetCategoriesInBrandCubit>()
                          .selectBrand(isSelected: true);
                    },
                    changeBandsListIndex: () {
                      context
                          .read<ChangeBrandListViewIndexCubit>()
                          .changeIndex(newIndex: index);
                    },
                    getAllBrands: () async {
                      await  context.read<GetAllBrandsCubit>().getAllBrands();
                    },
                    changeBrandTitle: () {
                      context.read<ChangeBrandTitleCubit>().changeBrandName(
                          newBrandName: state.allBrandsData[index].name ?? "");
                    },
                    getCategoriesByBrandId: () async {
                      await context
                          .read<GetCategoriesBrandIdCubit>()
                          .getCategoriesByBrandId(
                        brandId: state.allBrandsData[index].id ?? '',
                      );
                    },
                  ),
                );
              },
            ),
          );
        } else if (state is GetAllBrandsFailure) {
          return FailureStateWidget(errorMessage: state.errorMessage);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
