import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkify_app/core/utils/color_manager.dart';

abstract class Styles {
  static TextStyle textStyle24 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 24.sp,
    color: ColorManager.texColor,
  );
  static TextStyle textStyle20 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20.sp,
    color: Colors.white,
  );
  static TextStyle textStyle18 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18.sp,
    color: Colors.white,
  );
  static TextStyle textStyle16 = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 16.sp,
    color: Colors.white,
  );
  static TextStyle textStyle14 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    color: ColorManager.texColor,
  );
  static TextStyle textStyle11 = TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeight.w400,
    color: ColorManager.mainColor.withOpacity(0.6),
  );
  static TextStyle textStyle25 = TextStyle(
    fontSize: 25.sp,
    fontWeight: FontWeight.w500,
    color: ColorManager.texColor,
  );
}
