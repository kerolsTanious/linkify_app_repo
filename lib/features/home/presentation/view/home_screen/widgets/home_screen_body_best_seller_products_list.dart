import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkify_app/core/reusable_components/failure_state_widget.dart';
import 'package:linkify_app/core/reusable_components/product_list_view_item.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_all_products_by_category_id/get_all_products_by_category_id_state.dart';

import '../../../view_model/get_all_products_by_category_id/get_all_products_by_category_id_cubit.dart';

class HomeScreenBodyProductList extends StatefulWidget {
  const HomeScreenBodyProductList({super.key});

  @override
  State<HomeScreenBodyProductList> createState() =>
      _HomeScreenBodyProductListState();
}

class _HomeScreenBodyProductListState extends State<HomeScreenBodyProductList> {
  @override
  void initState() {
    super.initState();
    context.read<GetAllProductsByCategoryIdCubit>().getAllProductsByCategoryId(
          categoryId: "680cad6e55107332d3460ccf",
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllProductsByCategoryIdCubit,
        GetAllProductsByCategoryIdState>(
      builder: (context, state) {
        if (state is GetAllProductsByCategoryIdSuccess) {
          return SizedBox(
            height: 260.h,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.getAllProductsByCategoryIdData.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: ProductListViewItem(
                    index: index,
                    productData: state.getAllProductsByCategoryIdData[index],
                  ),
                );
              },
            ),
          );
        } else if (state is GetAllProductsByCategoryIdFailure) {
          return FailureStateWidget(errorMessage: state.errorMessage);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
