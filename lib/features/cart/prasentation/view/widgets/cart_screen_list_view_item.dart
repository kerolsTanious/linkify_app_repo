import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:linkify_app/core/prefs.dart';
import 'package:linkify_app/core/utils/assets_manager.dart';
import 'package:linkify_app/core/utils/color_manager.dart';
import 'package:linkify_app/core/utils/styles_manager.dart';
import 'package:linkify_app/features/cart/data/models/get_products_in_cart/GetProductsInCartItems.dart';
import 'package:linkify_app/features/cart/prasentation/view_model/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:linkify_app/features/cart/prasentation/view_model/delete_item_from_cart_cubit/delete_item_from_cart_cubit.dart';

import '../../view_model/delete_item_from_cart_cubit/delete_item_from_cart_state.dart';

class CartScreenListViewItem extends StatelessWidget {
  const CartScreenListViewItem({
    super.key,
    required this.getCartItemData,
  });

  final GetProductsInCartItems getCartItemData;

  @override
  Widget build(BuildContext context) {
    double price =
        (double.tryParse((getCartItemData.price ?? "").split(" ").first) ??
                0.0) *
            12;

    String price2 = price.toStringAsFixed(2);
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Container(
        height: 115.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
            color: ColorManager.mainColor.withOpacity(0.3),
            width: 2.w,
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 120.w,
              height: 115.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: Container(
                  padding: REdgeInsets.all(5),
                  child: CachedNetworkImage(
                    imageUrl:
                        getCartItemData.subcategory?.image?[0].secureUrl ?? "",
                    fadeInDuration: const Duration(milliseconds: 500),
                    errorWidget: (context, url, error) {
                      return Container(
                        width: 120.w,
                        height: 115.h,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.image_not_supported,
                            color: ColorManager.mainColor,
                            size: 25.sp,
                          ),
                        ),
                      );
                    },
                    placeholder: (context, url) {
                      return Container(
                        height: 120.h,
                        width: 115.w,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: const Center(child: CircularProgressIndicator()),
                      );
                    },
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        height: 115.h,
                        width: 120.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: imageProvider,
                          ),
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  getCartItemData.subcategory?.name ?? "",
                                  style: Styles.textStyle18.copyWith(
                                    color: ColorManager.texColor,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  getCartItemData.subcategory?.description ??
                                      "",
                                  style: Styles.textStyle18.copyWith(
                                    color: ColorManager.texColor,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10.w),
                        BlocConsumer<DeleteItemFromCartCubit,
                            DeleteItemFromCartState>(
                          listener: (context, state) {
                            if (state is DeleteItemFromCartSuccess &&
                                getCartItemData.id == state.productId) {
                              context.read<AddToCartCubit>().getCart(
                                    token: PrefsHelper.getToken(
                                      key: PrefsKey.token,
                                    ),
                                  );
                              Fluttertoast.showToast(
                                  msg: "🗑️ تم حذف المنتج من سلة المشتريات",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                            if (state is DeleteItemFromCartFailure &&
                                getCartItemData.id == state.productId) {
                              Fluttertoast.showToast(
                                  msg: state.errorMessage,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          },
                          builder: (context, state) {
                            if (state is DeleteItemFromCartLoading &&
                                getCartItemData.id == state.productId) {
                              return Container(
                                margin: REdgeInsets.only(right: 5),
                                width: 30.w,
                                height: 30.h,
                                child: CircularProgressIndicator(
                                    color: ColorManager.mainColor),
                              );
                            }
                            return Container(
                              width: 20.w,
                              height: 22.h,
                              margin: REdgeInsets.all(12.5),
                              child: InkWell(
                                onTap: () {
                                  context
                                      .read<DeleteItemFromCartCubit>()
                                      .deleteItemFromCart(
                                        token: PrefsHelper.getToken(
                                          key: PrefsKey.token,
                                        ),
                                        itemId: getCartItemData.id ?? "",
                                      );
                                },
                                child: SvgPicture.asset(
                                  width: 20.w,
                                  height: 22.h,
                                  AssetsManager.deleteIcon,
                                  colorFilter: ColorFilter.mode(
                                    ColorManager.mainColor,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            " ج.م ${((getCartItemData.quantity ?? 0) * price).toStringAsFixed(2)}",
                            style: Styles.textStyle18
                                .copyWith(color: ColorManager.texColor),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          margin: REdgeInsets.all(5),
                          width: 125.w,
                          height: 45.h,
                          decoration: BoxDecoration(
                            color: ColorManager.mainColor,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  context.read<AddToCartCubit>().updateCart(
                                        token: PrefsHelper.getToken(
                                            key: PrefsKey.token),
                                        itemId: getCartItemData.id ?? "",
                                        quantity:
                                            (getCartItemData.quantity! + 1)
                                                .toString(),
                                      );
                                },
                                child: const Icon(
                                  color: Colors.white,
                                  Icons.add_circle_outline,
                                ),
                              ),
                              Icon(
                                Icons.inventory_2_outlined,
                                color: Colors.white,
                                size: 20.sp,
                              ),
                              Text(
                                getCartItemData.quantity.toString(),
                                style: Styles.textStyle18.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  if (getCartItemData.quantity! > 1) {
                                    context.read<AddToCartCubit>().updateCart(
                                          token: PrefsHelper.getToken(
                                              key: PrefsKey.token),
                                          itemId: getCartItemData.id ?? "",
                                          quantity:
                                              (getCartItemData.quantity! - 1)
                                                  .toString(),
                                        );
                                  }
                                },
                                child: const Icon(
                                  color: Colors.white,
                                  Icons.remove_circle_outline_outlined,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
