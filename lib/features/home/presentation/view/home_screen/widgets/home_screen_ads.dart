import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkify_app/core/utils/assets_manager.dart';


class HomeScreenBodyAdsList extends StatelessWidget {
  HomeScreenBodyAdsList({
    super.key,
  });

  final List<String> ads = [
    AssetsManager.ad4,
    AssetsManager.ad5,
    AssetsManager.ad6,
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: ads.length,
      itemBuilder: (context, index, realIndex) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: SizedBox(
              width: double.infinity,
              child: Image.asset(
                ads[index],
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },

      options: CarouselOptions(
        height: 150.h,
        autoPlay: true,
        aspectRatio: 16/9,
        scrollDirection: Axis.horizontal,
        viewportFraction: 0.7,
        initialPage: 0,
        enlargeCenterPage: true,
        enlargeFactor: 0.25,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 1000),
      ),
    );
  }
}
