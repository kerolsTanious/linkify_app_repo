import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkify_app/features/home/presentation/view/home_screen/widgets/categories_products_body.dart';
import 'package:linkify_app/features/home/presentation/view/home_screen/widgets/home_Screen_body.dart';
import 'package:linkify_app/features/home/presentation/view_model/change_home_screen_body_cubit/change_home_screen_body_cubit.dart';
import 'package:linkify_app/features/home/presentation/view_model/change_home_screen_body_cubit/change_home_screen_body_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static List<Widget> homeScreenList = [
    const HomeScreenBody(),
    const CategoryProductsBody(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeHomeScreenBodyCubit, ChangeHomeScreenBodyState>(
      builder: (context, state) {
        if (state is ChangeHomeScreenBodySuccess) {
          return Padding(
            padding: REdgeInsets.symmetric(horizontal: 15),
            child: homeScreenList[
                context.read<ChangeHomeScreenBodyCubit>().currentIndex],
          );
        }
        return Padding(
          padding: REdgeInsets.symmetric(horizontal: 15),
          child: homeScreenList[0],
        );
      },
    );
  }
}
