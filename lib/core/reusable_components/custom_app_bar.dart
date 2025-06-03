import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:linkify_app/core/utils/assets_manager.dart';
import 'package:linkify_app/core/utils/color_manager.dart';
import 'package:linkify_app/core/utils/routes.dart';

import '../../features/cart/prasentation/view_model/add_to_cart_cubit/add_to_cart_cubit.dart';
import '../prefs.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(
        right: 15,
        bottom: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          Row(
            children: [
              Image.asset(
                AssetsManager.logoTrans,
                width: 50.w,
                height: 50.h,
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: ColorManager.mainColor,
                        width: 1.5.w,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 17.w),
                      const Icon(
                        Icons.search_outlined,
                        color: ColorManager.mainColor,
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  context.read<AddToCartCubit>().getCart(
                      token: PrefsHelper.getToken(key: PrefsKey.token));
                  context.push(RoutesManager.kCartScreen);
                },
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: ColorManager.mainColor,
                  weight: 30.w,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
