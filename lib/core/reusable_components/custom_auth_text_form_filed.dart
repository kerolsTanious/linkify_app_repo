import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkify_app/core/utils/color_manager.dart';
import 'package:linkify_app/core/utils/styles_manager.dart';

class CustomAuthTextFormFiled extends StatelessWidget {
  const CustomAuthTextFormFiled({
    super.key,
    required this.titleText,
    required this.hintText,
    required this.prefixIcon,
    required this.textInputType,
    required this.textInputAction,
    this.obscureText,
    this.suffixIcon,
    this.validator,
    this.controller,
    this.readOnly = false,
    this.maxLength,
    this.fillColor,
    this.hintStyleColor,
    this.prefixIconColor,
    this.titleColor,
    this.textStyle,
  });

  final String titleText;
  final String hintText;
  final Icon prefixIcon;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final bool? obscureText;
  final IconButton? suffixIcon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool readOnly;
  final int? maxLength;
  final Color? fillColor;
  final Color? hintStyleColor;
  final Color? prefixIconColor;
  final Color? titleColor;
  final Color? textStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleText,
          style: Styles.textStyle18.copyWith(
            color: titleColor == null
                ? Colors.white
                : const Color(0x00000000).withOpacity(0.7),
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 20.h),
        TextFormField(
          decoration: InputDecoration(
            fillColor:
                fillColor == null ? Colors.white : ColorManager.mainColor,
            filled: true,
            hintText: hintText,
            hintStyle: Styles.textStyle18.copyWith(
              fontWeight: FontWeight.w300,
              color: hintStyleColor == null
                  ? const Color(0x00000000).withOpacity(0.7)
                  : Colors.white,
            ),
            prefixIcon: prefixIcon,
            prefixIconColor: prefixIconColor == null
                ? const Color(0x00000000).withOpacity(0.7)
                : Colors.white,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.5.w,
                color: Colors.red.shade700,
              ),
              borderRadius: BorderRadius.circular(15.r),
            ),
            errorStyle: Styles.textStyle18.copyWith(
              color: Colors.red.shade900,
            ),
          ),
          style: Styles.textStyle18.copyWith(
            color: textStyle == null
                ? const Color(0xff000000).withOpacity(0.7)
                : Colors.white,
          ),
          maxLength: maxLength,
          readOnly: readOnly,
          keyboardType: textInputType,
          textInputAction: textInputAction,
          obscureText: obscureText ?? false,
          validator: validator,
          controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ],
    );
  }
}
