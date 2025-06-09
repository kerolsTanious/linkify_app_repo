import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:linkify_app/core/utils/color_manager.dart';
import 'package:linkify_app/core/utils/routes.dart';
import 'package:linkify_app/core/utils/styles_manager.dart';
import 'package:linkify_app/features/home/data/model/get_all_brands_model/AllBrandsData.dart';

class AdminSelectBrandListViewItem extends StatelessWidget {
  const AdminSelectBrandListViewItem({super.key, required this.allBrandsData});

  final AllBrandsData allBrandsData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go(RoutesManager.kAdminHome, extra: allBrandsData.id);
      },
      child: Container(
        margin: REdgeInsets.symmetric(
          vertical: 10,
          horizontal: 12,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: CachedNetworkImage(
                imageUrl: allBrandsData.image?[0].secureUrl ?? "",
                fadeInDuration: const Duration(milliseconds: 500),
                errorWidget: (context, url, error) {
                  return CircleAvatar(
                    radius: 50.r,
                    backgroundColor: ColorManager.mainColor.withOpacity(0.1),
                    child: Icon(
                      Icons.image_not_supported,
                      color: Colors.white,
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
                    height: 150.h,
                    width: 150.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                      ),
                      borderRadius: BorderRadius.circular(25.r),
                      border: Border.all(
                          color: Colors.grey.shade300,
                          width: 2.w),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              allBrandsData.name ?? "",
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: Styles.textStyle18.copyWith(
                fontWeight: FontWeight.w700,
                color: Colors.white
              ),
            )
          ],
        ),
      ),
    );
  }
}
