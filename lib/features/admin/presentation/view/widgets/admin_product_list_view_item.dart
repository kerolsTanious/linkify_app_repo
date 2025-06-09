import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkify_app/core/utils/color_manager.dart';
import 'package:linkify_app/core/utils/styles_manager.dart';
import 'package:linkify_app/features/home/data/model/get_all_products_by_category_id/GetAllProductsByCategoryIdData.dart';

class AdminProductListViewItem extends StatelessWidget {
  const AdminProductListViewItem({
    super.key,
    required this.productData,
    required this.index,
    this.icon,
    this.onTap,
  });

  final GetAllProductsByCategoryIdData productData;
  final int index;
  final Widget? icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final double itemPrice =
        double.parse((productData.price ?? "").split(" ")[0]) * 12;
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorManager.mainColor.withOpacity(0.6),
            width: 2.5.w,
          ),
          borderRadius: BorderRadius.circular(15.r),
          color: Colors.white,
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
                    icon ??
                        Icon(
                          Icons.remove_red_eye,
                          size: 30.sp,
                          color: ColorManager.mainColor,
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
