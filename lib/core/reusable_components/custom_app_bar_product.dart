import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:linkify_app/core/utils/assets_manager.dart';
import 'package:linkify_app/core/utils/color_manager.dart';
import 'package:linkify_app/core/utils/routes.dart';
import 'package:linkify_app/core/utils/styles_manager.dart';

import '../../features/cart/prasentation/view_model/add_to_cart_cubit/add_to_cart_cubit.dart';
import '../prefs.dart';

class CustomAppBarProduct extends StatelessWidget {
  const CustomAppBarProduct({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(
        right: 15,
        left: 15,
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
                child: Center(
                  child: Text(
                    "المنتجات",
                    style: Styles.textStyle24,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  context.read<AddToCartCubit>().getCart(
                        token: PrefsHelper.getToken(key: PrefsKey.token),
                      );
                  context.push(RoutesManager.kCartScreen);
                },
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: ColorManager.mainColor,
                  weight: 30.w,
                ),
              ),
              InkWell(
                onTap: onTap,
                child: Icon(
                  Icons.arrow_forward_outlined,
                  color: ColorManager.mainColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
