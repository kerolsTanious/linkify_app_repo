import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkify_app/core/utils/color_manager.dart';
import 'package:linkify_app/core/utils/styles_manager.dart';
import 'package:linkify_app/features/admin/presentation/view/widgets/admin_select_brand_grid_view.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_all_brands_cubit/get_all_brands_cubit.dart';

class AdminSelectBrandBody extends StatefulWidget {
  const AdminSelectBrandBody({super.key});

  @override
  State<AdminSelectBrandBody> createState() => _AdminSelectBrandBodyState();
}

class _AdminSelectBrandBodyState extends State<AdminSelectBrandBody> {
  @override
  void initState() {
    super.initState();
    context.read<GetAllBrandsCubit>().getAllBrands();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(40.r),
              bottomLeft: Radius.circular(40.r),
            )
          ),
          child: Column(
            children: [
              SizedBox(height: 12.5.h),
              Text(
                "اختر الشركة التي تمثلها",
                style: Styles.textStyle20.copyWith(
                  color: ColorManager.texColor,
                ),
              ),
              SizedBox(height: 12.5.h),
            ],
          ),
        ),
        Expanded(child: AdminSelectBrandGidView()),
      ],
    );
  }
}
