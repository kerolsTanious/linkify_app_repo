import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:linkify_app/core/utils/assets_manager.dart';
import 'package:linkify_app/core/utils/styles_manager.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        image == AssetsManager.onboarding3
            ? SizedBox(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height / 3,
                child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height / 3,
                  child: Image.asset(image),
                ),
              )
            : SvgPicture.asset(image),
        SizedBox(height: 15.h),
        Text(
          title,
          style: Styles.textStyle24,
        ),
        SizedBox(height: 15.h),
        Text(
          description,
          textAlign: TextAlign.center,
          style: Styles.textStyle18.copyWith(
            color: Colors.grey[500],
          ),
        ),
      ],
    );
  }
}
