import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkify_app/core/reusable_components/custom_app_bar_product.dart';
import 'package:linkify_app/core/reusable_components/failure_state_widget.dart';
import 'package:linkify_app/core/reusable_components/product_list_view_item.dart';
import 'package:linkify_app/features/home/presentation/view_model/change_home_screen_body_cubit/change_home_screen_body_cubit.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_all_products_by_category_id/get_all_products_by_category_id_cubit.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_all_products_by_category_id/get_all_products_by_category_id_state.dart';

class CategoryProductsBody extends StatelessWidget {
  const CategoryProductsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllProductsByCategoryIdCubit,
        GetAllProductsByCategoryIdState>(
      builder: (context, state) {
        if (state is GetAllProductsByCategoryIdSuccess) {
          return Column(
            children: [
              CustomAppBarProduct(onTap: () {
                context
                    .read<ChangeHomeScreenBodyCubit>()
                    .changeHomeScreenBody(newIndex: 0);
              }),
              Expanded(
                child: GridView.builder(
                  itemCount: state.getAllProductsByCategoryIdData.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 25.h,
                    crossAxisSpacing: 20.w,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) {
                    return ProductListViewItem(
                      index: index,
                      productData: state.getAllProductsByCategoryIdData[index],
                    );
                  },
                ),
              ),
            ],
          );
        } else if (state is GetAllProductsByCategoryIdFailure) {
          return FailureStateWidget(errorMessage: state.errorMessage);
        } else {
          return SizedBox();
        }
      },
    );
  }
}
