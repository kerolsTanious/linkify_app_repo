import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkify_app/core/reusable_components/failure_state_widget.dart';
import 'package:linkify_app/features/home/presentation/view/home_screen/widgets/categories_list_view_item.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_all_categories_cubit/get_all_categories_cubit.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_all_categories_cubit/get_all_categories_state.dart';

class HomeScreenBodyGridViewList extends StatelessWidget {
  const HomeScreenBodyGridViewList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllCategoriesCubit, GetAllCategoriesState>(
      builder: (context, state) {
        if (state is GetAllCategoriesSuccess) {
          return Container(
            padding: EdgeInsets.only(left: 17.r),
            width: double.infinity,
            height: 288.h,
            child: GridView.builder(
              itemCount: state.allCategoriesData.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 100.h,
                mainAxisSpacing: 10.w,
                crossAxisSpacing: 16.h,
              ),
              itemBuilder: (context, index) {
                return HomeScreenBodyGridViewItem(
                    allCategoriesData: state.allCategoriesData[index]);
              },
            ),
          );
        } else if (state is GetAllCategoriesFailure) {
          print("error =======> ${state.errorMessage}");
          return FailureStateWidget(errorMessage: state.errorMessage);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
