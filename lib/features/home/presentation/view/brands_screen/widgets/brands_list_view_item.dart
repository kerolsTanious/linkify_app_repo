import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkify_app/core/utils/color_manager.dart';
import 'package:linkify_app/core/utils/styles_manager.dart';
import 'package:linkify_app/features/home/data/model/get_all_brands_model/AllBrandsData.dart';

class BrandsListViewItem extends StatelessWidget {
  const BrandsListViewItem({
    super.key,
    required this.isSelected,
    required this.onTapOnCategoryItem,
    required this.onTapOnchangeCategoryTitle,
    required this.getCategoriesByBrandId,
    required this.brandsData,
  });

  final bool isSelected;

  final AllBrandsData brandsData;

  final Function onTapOnCategoryItem;

  final Function onTapOnchangeCategoryTitle;

  final Function getCategoriesByBrandId;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTapOnCategoryItem();
        onTapOnchangeCategoryTitle();
        getCategoriesByBrandId();
      },
      child: isSelected
          ? Container(
              width: 140.w,
              height: 85.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Container(
                    margin: REdgeInsets.all(5),
                    width: 8.w,
                    height: 85.h,
                    decoration: BoxDecoration(
                        color: ColorManager.mainColor,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  Center(
                    child: Text(
                      brandsData.name ?? "",
                      style: Styles.textStyle18.copyWith(
                          fontWeight: FontWeight.w500,
                          color: ColorManager.texColor),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            )
          : Container(
              width: 140.w,
              height: 85.h,
              decoration: BoxDecoration(
                borderRadius: isSelected
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      )
                    : BorderRadius.circular(0),
                color: ColorManager.categoryBackgroundColor.withOpacity(0.5),
              ),
              child: Center(
                child: Text(
                  brandsData.name ?? "",
                  style: Styles.textStyle18.copyWith(
                    fontWeight: FontWeight.w500,
                    color: ColorManager.texColor,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
    );
  }
}
