import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkify_app/core/dependency_injection.dart';
import 'package:linkify_app/core/reusable_components/failure_state_widget.dart';
import 'package:linkify_app/core/reusable_components/product_list_view_item.dart';
import 'package:linkify_app/features/cart/data/repo_impl/cart_repo_impl.dart';
import 'package:linkify_app/features/cart/prasentation/view_model/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_all_products_by_category_id/get_all_products_by_category_id_cubit.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_all_products_by_category_id/get_all_products_by_category_id_state.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllProductsByCategoryIdCubit,
        GetAllProductsByCategoryIdState>(
      builder: (context, state) {
        if (state is GetAllProductsByCategoryIdSuccess) {
          return Padding(
            padding: REdgeInsets.all(15),
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
                  productData: state.getAllProductsByCategoryIdData[index],
                  index: index,
                );
              },
            ),
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
