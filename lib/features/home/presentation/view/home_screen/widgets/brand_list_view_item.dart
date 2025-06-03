import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkify_app/core/utils/color_manager.dart';
import 'package:linkify_app/core/utils/styles_manager.dart';
import 'package:linkify_app/features/home/data/model/get_all_brands_model/AllBrandsData.dart';

class HomeScreenBodyListViewItem extends StatelessWidget {
  const HomeScreenBodyListViewItem({
    super.key,
    required this.allBrandsData,
    required this.changeSelectedBool,
    required this.getCategoriesByBrandId,
    required this.getAllBrands,
    required this.changeBrandTitle,
    required this.changeBandsListIndex,
  });

  final AllBrandsData allBrandsData;
  final Function getAllBrands;
  final Function changeSelectedBool;
  final Function getCategoriesByBrandId;
  final Function changeBrandTitle;
  final Function changeBandsListIndex;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        changeBandsListIndex();
        changeSelectedBool();
        getCategoriesByBrandId();
        getAllBrands();
        changeBrandTitle();
      },
      splashColor: Colors.transparent,
      child: SizedBox(
        height: 144.h,
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: allBrandsData.image?[0].secureUrl ?? "",
              fadeInDuration: const Duration(milliseconds: 500),
              errorWidget: (context, url, error) {
                return CircleAvatar(
                  radius: 50.r,
                  backgroundColor: ColorManager.mainColor.withOpacity(0.1),
                  child: Icon(
                    Icons.image_not_supported,
                    color: ColorManager.mainColor,
                    size: 45,
                  ),
                );
              },
              placeholder: (context, url) {
                return CircleAvatar(
                  radius: 50.r,
                  backgroundColor: ColorManager.mainColor.withOpacity(0.1),
                  child: const CircularProgressIndicator(),
                );
              },
              imageBuilder: (context, imageProvider) {
                return Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                    ),
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(
                        color: ColorManager.mainColor.withOpacity(0.8),
                        width: 3.w),
                  ),
                );
              },
            ),
            SizedBox(height: 5.h),
            Expanded(
              child: Text(
                allBrandsData.name ?? "".split(" ").join("\n"),
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: Styles.textStyle14,
              ),
            )
          ],
        ),
      ),
    );
  }
}
