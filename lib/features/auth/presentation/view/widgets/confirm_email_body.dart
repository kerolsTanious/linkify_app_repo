import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkify_app/core/utils/assets_manager.dart';
import 'package:linkify_app/core/utils/color_manager.dart';
import 'package:linkify_app/core/utils/styles_manager.dart';

class ConfirmEmailBody extends StatelessWidget {
  const ConfirmEmailBody({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: REdgeInsets.symmetric(
        horizontal: 25,
        vertical: 25,
      ),
      children: [
        Image.asset(
          width: double.infinity,
          AssetsManager.otpGif,
        ),
        SizedBox(height: 50.h),
        TextFormField(
          decoration: InputDecoration(
            fillColor: ColorManager.mainColor,
            hintText: email,
            filled: true,
            hintStyle: Styles.textStyle18
                .copyWith(fontWeight: FontWeight.w300, color: Colors.white),
            prefixIcon: const Icon(
              Icons.email_outlined,
              color: Colors.white,
            ),
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
          readOnly: true,
        ),
        SizedBox(height: 50.h),
        OtpTextField(
          numberOfFields: 4,
          showFieldAsBox: true,
          filled: true,
          fillColor: ColorManager.mainColor,
          styles: List.generate(
            4,
            (index) => TextStyle(
              color: Colors.white,
              fontSize: 25.sp,
            ),
          ),
          onCodeChanged: (String code) {},
          onSubmit: (String verificationCode) {},
        ),
      ],
    );
  }
}
