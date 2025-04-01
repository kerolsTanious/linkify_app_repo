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
}
