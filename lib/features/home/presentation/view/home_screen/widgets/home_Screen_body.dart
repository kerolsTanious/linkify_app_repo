import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkify_app/core/reusable_components/custom_app_bar.dart';
import 'package:linkify_app/core/reusable_components/list_view_description.dart';
import 'package:linkify_app/core/utils/strings_manager.dart';
import 'package:linkify_app/features/home/presentation/view/home_screen/widgets/brand_list_view.dart';
import 'package:linkify_app/features/home/presentation/view/home_screen/widgets/categories_list_view.dart';
import 'package:linkify_app/features/home/presentation/view/home_screen/widgets/home_screen_ads.dart';
import 'package:linkify_app/features/home/presentation/view/home_screen/widgets/home_screen_body_best_seller_products_list.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: CustomAppBar()),
        SliverToBoxAdapter(child: HomeScreenBodyAdsList()),
        SliverToBoxAdapter(child: SizedBox(height: 24.h)),
        const SliverToBoxAdapter(
            child: ListViewDescription(
                listViewName: StringsManager.categoryDescription)),
        SliverToBoxAdapter(child: SizedBox(height: 16.h)),
        const SliverToBoxAdapter(child: HomeScreenBodyGridViewList()),
        SliverToBoxAdapter(child: SizedBox(height: 24.h)),
        SliverToBoxAdapter(
            child: const ListViewDescription(
                listViewName: StringsManager.brandDescription)),
        SliverToBoxAdapter(child: SizedBox(height: 16.h)),
        SliverToBoxAdapter(child: HomeScreenBodyListView()),
        SliverToBoxAdapter(child: SizedBox(height: 24.h)),
        SliverToBoxAdapter(
            child: const ListViewDescription(
                listViewName: StringsManager.bestSellerProducts)),
        SliverToBoxAdapter(child: SizedBox(height: 16.h)),
        const SliverToBoxAdapter(child: HomeScreenBodyProductList()),
        SliverToBoxAdapter(child: SizedBox(height: 24.h)),
      ],
    );
  }
}
