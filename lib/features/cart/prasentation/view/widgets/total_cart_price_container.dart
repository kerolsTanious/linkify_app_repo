import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:linkify_app/core/prefs.dart';
import 'package:linkify_app/core/utils/color_manager.dart';
import 'package:linkify_app/core/utils/routes.dart';
import 'package:linkify_app/core/utils/strings_manager.dart';
import 'package:linkify_app/core/utils/styles_manager.dart';

class TotalPriceCartContainer extends StatelessWidget {
  const TotalPriceCartContainer({
    super.key,
    required this.totalPrice,
    required this.cartId,
  });

  final String totalPrice;
  final String cartId;

  @override
  Widget build(BuildContext context) {
    final double totalPriceBeforeDiscount = double.parse(totalPrice) * 12;
    final double discount = totalPriceBeforeDiscount * 0.005;
    final double totalPriceAfterDiscount = totalPriceBeforeDiscount - discount;

    return Container(
      width: double.infinity,
      height: 100.h,
      margin: REdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: ColorManager.mainColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        children: [
          Padding(
            padding: REdgeInsets.only(
              top: 20,
              left: 16,
              right: 16,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  StringsManager.totalPrice,
                  style: Styles.textStyle18.copyWith(
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  " ج.م ${totalPriceAfterDiscount.toStringAsFixed(2)}",
                  style: Styles.textStyle18.copyWith(
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Padding(
            padding: REdgeInsets.only(
              top: 20,
              right: 16,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "خصم",
                  style: Styles.textStyle18.copyWith(
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  " ج.م ${discount.toStringAsFixed(2)}",
                  style: Styles.textStyle18.copyWith(
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                context.push(
                  RoutesManager.kAddressScreen,
                  extra: cartId,
                );
                PrefsHelper.setString(
                  key: PrefsKey.totalAmount,
                  value: totalPriceAfterDiscount.toStringAsFixed(2),
                );
              },
              child: Container(
                height: 55.h,
                margin: REdgeInsets.only(
                  right: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(0, 4),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      StringsManager.checkOut,
                      style: Styles.textStyle20
                          .copyWith(color: ColorManager.texColor),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: ColorManager.mainColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
