import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkify_app/core/utils/color_manager.dart';
import 'package:linkify_app/core/utils/styles_manager.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({
    super.key,
    required this.buttonTitle,
    required this.onTap,
    this.backgroundColor,
    this.buttonTitleColor,
  });

  final String buttonTitle;
  final void Function() onTap;
  final Color? backgroundColor;
  final Color? buttonTitleColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 65.h,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              backgroundColor == null ? Colors.white : ColorManager.mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
        child: Text(
          buttonTitle,
          style: Styles.textStyle20.copyWith(
            color: buttonTitleColor == null
                ? ColorManager.mainColor
                : Colors.white,
          ),
        ),
      ),
    );
  }
}
