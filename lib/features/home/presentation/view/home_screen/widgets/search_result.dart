import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:linkify_app/core/prefs.dart';
import 'package:linkify_app/core/utils/assets_manager.dart';
import 'package:linkify_app/core/utils/color_manager.dart';
import 'package:linkify_app/core/utils/routes.dart';
import 'package:linkify_app/core/utils/styles_manager.dart';
import 'package:linkify_app/features/cart/prasentation/view_model/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:linkify_app/features/home/data/model/search_model/SearchResponse.dart';
import 'package:linkify_app/features/home/presentation/view/home_screen/widgets/product_list_view_item_search.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key, required this.searchResponse});

  final SearchResponse searchResponse;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: REdgeInsets.all(20),
          child: Column(
            children: [
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
                        "نتائج البحث",
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
                    onTap: () => context.pop(),
                    child: Icon(
                      Icons.arrow_forward_outlined,
                      color: ColorManager.mainColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Expanded(
                child: GridView.builder(
                  itemCount: searchResponse.data?.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 25.h,
                    crossAxisSpacing: 20.w,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) {
                    return ProductListViewItemSearch(
                      productData: searchResponse.data![index],
                      index: index,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
