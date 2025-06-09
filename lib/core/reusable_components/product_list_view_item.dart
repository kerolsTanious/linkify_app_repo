import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:linkify_app/core/prefs.dart';
import 'package:linkify_app/core/utils/assets_manager.dart';
import 'package:linkify_app/core/utils/color_manager.dart';
import 'package:linkify_app/core/utils/strings_manager.dart';
import 'package:linkify_app/core/utils/styles_manager.dart';
import 'package:linkify_app/features/cart/prasentation/view_model/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:linkify_app/features/cart/prasentation/view_model/add_to_cart_cubit/add_to_cart_state.dart';
import 'package:linkify_app/features/home/data/model/get_all_products_by_category_id/GetAllProductsByCategoryIdData.dart';

class ProductListViewItem extends StatelessWidget {
  const ProductListViewItem({
    super.key,
    required this.productData,
    required this.index,
  });

  final GetAllProductsByCategoryIdData productData;
  final int index;

  @override
  Widget build(BuildContext context) {
    final double itemPrice =
        double.parse((productData.price ?? "").split(" ")[0]) * 12;
    return InkWell(
      onTap: () {},
      splashColor: Colors.transparent,
      child: Container(
        width: 190.w,
        height: 260.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorManager.mainColor.withOpacity(0.6),
            width: 2.5.w,
          ),
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: productData.image?[0].secureUrl ?? '',
                    height: 128.h,
                    width: 190.w,
                    errorWidget: (context, url, error) {
                      return Container(
                        height: 128.h,
                        width: 190.w,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.image_not_supported,
                            color: ColorManager.mainColor,
                            size: 35,
                          ),
                        ),
                      );
                    },
                    placeholder: (context, url) {
                      return Container(
                        height: 128.h,
                        width: 190.w,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(child: CircularProgressIndicator()),
                      );
                    },
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        height: 128.h,
                        width: 190.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 5,
                    top: 5,
                  ),
                  child: InkWell(
                    onTap: () {},
                    splashColor: Colors.transparent,
                    child: Icon(Icons.favorite_border),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                bottom: 8,
              ),
              child: Text(
                productData.name ?? '',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Styles.textStyle14,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                bottom: 8,
              ),
              child: Text(
                productData.description ?? "",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Styles.textStyle14,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: 8.h,
                  right: 8.w,
                  left: 8.w,
                ),
                child: Row(
                  children: [
                    Text(
                      "${itemPrice.toStringAsFixed(2)} ج.م ",
                      style: Styles.textStyle14.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    BlocConsumer<AddToCartCubit, AddToCartState>(
                      listener: (context, state) {
                        if (state is AddToCartSuccess &&
                            productData.id == state.productId) {
                          Fluttertoast.showToast(
                            msg: StringsManager.addedToCartSuccess,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }
                        if (state is AddToCartFailure &&
                            productData.id == state.productId) {
                          Fluttertoast.showToast(
                            msg: state.errorMessage,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is AddToCartLoading &&
                            productData.id == state.productId) {
                          return CircularProgressIndicator(
                            color: ColorManager.mainColor,
                          );
                        }
                        return InkWell(
                          onTap: () {
                            context.read<AddToCartCubit>().addToCart(
                                  token:
                                      PrefsHelper.getToken(key: PrefsKey.token),
                                  subcategoryId: productData.id ?? "",
                                );
                          },
                          child: SvgPicture.asset(
                            height: 30.h,
                            width: 30.w,
                            AssetsManager.plusIcon,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
