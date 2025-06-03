import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkify_app/core/reusable_components/custom_app_bar_product.dart';
import 'package:linkify_app/features/home/presentation/view/brands_screen/widgets/products_list_view.dart';
import 'package:linkify_app/features/home/presentation/view_model/change_brand_screen_body/change_brand_screen_body_cubit.dart';


class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBarProduct(
          onTap: () {
            context.read<ChangeBrandScreenBodyCubit>().changeIndex(newIndex: 0);
          },
        ),
        const Expanded(
          child: ProductsListView(),
        ),
      ],
    );
  }
}
