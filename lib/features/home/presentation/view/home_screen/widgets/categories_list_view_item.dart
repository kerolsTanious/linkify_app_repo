import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkify_app/core/utils/color_manager.dart';
import 'package:linkify_app/core/utils/styles_manager.dart';
import 'package:linkify_app/features/home/data/model/get_all_categories_model/AllCategoriesData.dart';
import 'package:linkify_app/features/home/presentation/view_model/change_home_screen_body_cubit/change_home_screen_body_cubit.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_all_products_by_category_id/get_all_products_by_category_id_cubit.dart';

class HomeScreenBodyGridViewItem extends StatelessWidget {
  const HomeScreenBodyGridViewItem({
    super.key,
    required this.allCategoriesData,
  });

  final AllCategoriesData allCategoriesData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context
            .read<ChangeHomeScreenBodyCubit>()
            .changeHomeScreenBody(newIndex: 1);
        context
            .read<GetAllProductsByCategoryIdCubit>()
            .getAllProductsByCategoryId(categoryId: allCategoriesData.id ?? '');
      },
      splashColor: Colors.transparent,
      child: SizedBox(
        height: 145.h,
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: allCategoriesData.image?[0].secureUrl ?? "",
              fadeInDuration: const Duration(milliseconds: 500),
              errorWidget: (context, url, error) {
                return CircleAvatar(
                  radius: 45.r,
                  backgroundColor: ColorManager.mainColor.withOpacity(0.1),
                  child: const Icon(
                    Icons.image_not_supported,
                    color: ColorManager.mainColor,
                    size: 35,
                  ),
                );
              },
              placeholder: (context, url) {
                return CircleAvatar(
                  radius: 45.r,
                  backgroundColor: ColorManager.mainColor.withOpacity(0.1),
                  child: const CircularProgressIndicator(),
                );
              },
              imageBuilder: (context, imageProvider) {
                return CircleAvatar(
                  radius: 45.r,
                  backgroundImage: imageProvider,
                );
              },
            ),
            SizedBox(height: 5.h),
            Expanded(
              child: Text(
                allCategoriesData.name ?? "".split(' ').join('\n'),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Styles.textStyle14,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
