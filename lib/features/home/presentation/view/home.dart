import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:linkify_app/core/utils/assets_manager.dart';
import 'package:linkify_app/core/utils/color_manager.dart';
import 'package:linkify_app/features/home/presentation/view/brands_screen/brands_screen.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_categories_in_brand/get_categories_in_brand_cubit.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_categories_in_brand/get_categories_in_brand_state.dart';

import 'home_screen/home_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static List<Widget> screensBody = [
    HomeScreen(),
    BrandsScreen(),
    Container(
      color: Colors.black,
    ),
  ];

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<GetCategoriesInBrandCubit, GetCategoriesInBrandState>(
        builder: (context, state) {
          if (state is GetCategoriesInBrandSuccess) {
            return Scaffold(
              body: state.isSelected
                  ? Home.screensBody[1]
                  : Home.screensBody[currentIndex],
              bottomNavigationBar: Padding(
                padding: REdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: 10,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 85.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(25.r),
                      bottomLeft: Radius.circular(25.r),
                      topLeft: Radius.circular(25.r),
                      topRight: Radius.circular(25.r),
                    ),
                    child: BottomNavigationBar(
                      items: [
                        BottomNavigationBarItem(
                          icon: SvgPicture.asset(
                            AssetsManager.unSelectedHome,
                            width: 40.w,
                            height: 40.h,
                          ),
                          activeIcon: SvgPicture.asset(
                            AssetsManager.selectedHome,
                            width: 40.w,
                            height: 40.h,
                          ),
                          label: "",
                        ),
                        BottomNavigationBarItem(
                          icon: SvgPicture.asset(
                            AssetsManager.unSelectedCategory,
                            width: 40.w,
                            height: 40.h,
                          ),
                          activeIcon: SvgPicture.asset(
                            AssetsManager.selectedCategory,
                            width: 40.w,
                            height: 40.h,
                          ),
                          label: "",
                        ),
                        BottomNavigationBarItem(
                          icon: SvgPicture.asset(
                            AssetsManager.unSelectedProfile,
                            width: 40.w,
                            height: 40.h,
                          ),
                          activeIcon: SvgPicture.asset(
                            AssetsManager.selectedProfile,
                            width: 40.w,
                            height: 40.h,
                          ),
                          label: "",
                        ),
                      ],
                      backgroundColor: ColorManager.mainColor,
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      currentIndex: currentIndex,
                      onTap: (value) {
                        currentIndex = value;
                        context.read<GetCategoriesInBrandCubit>().selected ==
                                true
                            ? context
                                .read<GetCategoriesInBrandCubit>()
                                .selectBrand(isSelected: false)
                            : null;
                        setState(() {});
                      },
                      type: BottomNavigationBarType.fixed,
                    ),
                  ),
                ),
              ),
            );
          }
          return Scaffold(
            body: Home.screensBody[currentIndex],
            bottomNavigationBar: Padding(
              padding: REdgeInsets.only(
                left: 10,
                right: 10,
                bottom: 10,
              ),
              child: SizedBox(
                width: double.infinity,
                height: 85.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25.r),
                    bottomLeft: Radius.circular(25.r),
                    topLeft: Radius.circular(25.r),
                    topRight: Radius.circular(25.r),
                  ),
                  child: BottomNavigationBar(
                    items: [
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          AssetsManager.unSelectedHome,
                          width: 40.w,
                          height: 40.h,
                        ),
                        activeIcon: SvgPicture.asset(
                          AssetsManager.selectedHome,
                          width: 40.w,
                          height: 40.h,
                        ),
                        label: "",
                      ),
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          AssetsManager.unSelectedCategory,
                          width: 40.w,
                          height: 40.h,
                        ),
                        activeIcon: SvgPicture.asset(
                          AssetsManager.selectedCategory,
                          width: 40.w,
                          height: 40.h,
                        ),
                        label: "",
                      ),
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          AssetsManager.unSelectedProfile,
                          width: 40.w,
                          height: 40.h,
                        ),
                        activeIcon: SvgPicture.asset(
                          AssetsManager.selectedProfile,
                          width: 40.w,
                          height: 40.h,
                        ),
                        label: "",
                      ),
                    ],
                    backgroundColor: ColorManager.mainColor,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    currentIndex: currentIndex,
                    onTap: (value) {
                      currentIndex = value;
                      setState(() {});
                    },
                    type: BottomNavigationBarType.fixed,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
