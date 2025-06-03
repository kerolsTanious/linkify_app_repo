import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:linkify_app/core/prefs.dart';
import 'package:linkify_app/core/reusable_components/failure_state_widget.dart';
import 'package:linkify_app/core/utils/assets_manager.dart';
import 'package:linkify_app/core/utils/color_manager.dart';
import 'package:linkify_app/core/utils/routes.dart';
import 'package:linkify_app/core/utils/strings_manager.dart';
import 'package:linkify_app/core/utils/styles_manager.dart';
import 'package:linkify_app/features/cart/prasentation/view/widgets/cart_screen_list_view.dart';
import 'package:linkify_app/features/cart/prasentation/view/widgets/total_cart_price_container.dart';
import 'package:linkify_app/features/cart/prasentation/view_model/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:linkify_app/features/cart/prasentation/view_model/add_to_cart_cubit/add_to_cart_state.dart';

class CartScreenBody extends StatefulWidget {
  const CartScreenBody({super.key});

  @override
  State<CartScreenBody> createState() => _CartScreenBodyState();
}

class _CartScreenBodyState extends State<CartScreenBody> {
  @override
  void initState() {
    super.initState();
    context
        .read<AddToCartCubit>()
        .getCart(token: PrefsHelper.getToken(key: PrefsKey.token));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddToCartCubit, AddToCartState>(
      builder: (context, state) {
        if (state is GetCartSuccess) {
          if (state.getProductInCartResponse.data!.items!.isEmpty) {
            return Column(
              children: [
                SizedBox(height: 10.h),
                Row(
                  children: [
                    SizedBox(width: 15.w),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          StringsManager.cart,
                          style: Styles.textStyle24.copyWith(
                            color: ColorManager.texColor,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        context.go(RoutesManager.kHome);
                      },
                      child: Icon(
                        Icons.arrow_forward_outlined,
                        color: ColorManager.mainColor,
                      ),
                    ),
                    SizedBox(width: 10.w),
                  ],
                ),
                Expanded(
                  child: Image.asset(
                    AssetsManager.addToCart,
                    width: double.infinity,
                    height: 400.h,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 300.h,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      StringsManager.emptyCartMessage,
                      style: Styles.textStyle20
                          .copyWith(color: ColorManager.texColor),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Column(
              children: [
                SizedBox(height: 10.h),
                Row(
                  children: [
                    SizedBox(width: 15.w),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          StringsManager.cart,
                          style: Styles.textStyle24.copyWith(
                            color: ColorManager.texColor,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: Icon(
                        Icons.arrow_forward_outlined,
                        color: ColorManager.mainColor,
                      ),
                    ),
                    SizedBox(width: 10.w),
                  ],
                ),
                Expanded(
                  child: CartScreenListView(
                      getProductsInCartItems:
                          state.getProductInCartResponse.data?.items ?? []),
                ),
                TotalPriceCartContainer(
                  totalPrice:
                      state.getProductInCartResponse.data?.totalPrice ?? "",
                  cartId: state.getProductInCartResponse.data?.id ?? "",
                ),
              ],
            );
          }
        } else if (state is GetCartFailure) {
          return FailureStateWidget(errorMessage: state.errorMessage);
        } else if (state is UpdateItemCartSuccess) {
          return Column(
            children: [
              SizedBox(height: 10.h),
              Row(
                children: [
                  SizedBox(width: 15.w),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        StringsManager.cart,
                        style: Styles.textStyle24.copyWith(
                          color: ColorManager.texColor,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.pop();
                    },
                    child: Icon(
                      Icons.arrow_forward_outlined,
                      color: ColorManager.mainColor,
                    ),
                  ),
                  SizedBox(width: 10.w),
                ],
              ),
              Expanded(
                child: CartScreenListView(
                    getProductsInCartItems:
                        state.getProductInCartResponse.data?.items ?? []),
              ),
              TotalPriceCartContainer(
                totalPrice:
                    state.getProductInCartResponse.data?.totalPrice ?? "",
                cartId: state.getProductInCartResponse.data?.id ?? "",
              ),
            ],
          );
        } else if (state is UpdateItemCartFailure) {
          return FailureStateWidget(errorMessage: state.errorMessage);
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: ColorManager.mainColor,
            ),
          );
        }
      },
    );
  }
}
