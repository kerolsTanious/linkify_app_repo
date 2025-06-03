import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkify_app/features/home/presentation/view/brands_screen/widgets/brands_screen_body.dart';
import 'package:linkify_app/features/home/presentation/view/brands_screen/widgets/products_screen.dart';
import 'package:linkify_app/features/home/presentation/view_model/change_brand_screen_body/change_brand_screen_body_cubit.dart';
import 'package:linkify_app/features/home/presentation/view_model/change_brand_screen_body/change_brand_screen_body_state.dart';

class BrandsScreen extends StatelessWidget {
  const BrandsScreen({super.key});

  static const List<Widget> brandsScreenBody = [
    BrandsScreenBody(),
    ProductsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeBrandScreenBodyCubit, ChangeBrandScreenBodyState>(
      builder: (BuildContext context, state) {
        if (state is ChangeBrandScreenBodySuccess) {
          return brandsScreenBody[state.newIndex];
        } else {
          return brandsScreenBody[0];
        }
      },
    );
  }
}
