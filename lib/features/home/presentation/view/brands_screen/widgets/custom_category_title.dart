import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkify_app/core/utils/styles_manager.dart';
import 'package:linkify_app/features/home/presentation/view_model/change_brand_title_cubit/change_brand_title_cubit.dart';
import 'package:linkify_app/features/home/presentation/view_model/change_brand_title_cubit/change_brand_title_state.dart';

class CustomCategoryTitle extends StatelessWidget {
  const CustomCategoryTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeBrandTitleCubit, ChangeBrandTitleState>(
      builder: (context, state) {
        if(state is ChangeBrandTitleSuccess){
          return Padding(
            padding: REdgeInsets.all(30),
            child: Text(
              state.brandName,
              style: Styles.textStyle18.copyWith(
                fontWeight: FontWeight.w700,
                color: Colors.blue.shade900,
              ),
            ),
          );
        }
        return Padding(
          padding: REdgeInsets.all(30),
          child: Text(
            "جهينة",
            style: Styles.textStyle18.copyWith(
              fontWeight: FontWeight.w700,
              color: Colors.blue.shade900,
            ),
          ),
        );
      },
    );
  }
}
