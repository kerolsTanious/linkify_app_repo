import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:linkify_app/core/prefs.dart';
import 'package:linkify_app/core/utils/assets_manager.dart';
import 'package:linkify_app/core/utils/color_manager.dart';
import 'package:linkify_app/core/utils/routes.dart';
import 'package:linkify_app/core/utils/styles_manager.dart';
import 'package:linkify_app/features/auth/data/model/confirm_email_input_model.dart';
import 'package:linkify_app/features/auth/presentation/view_model/confirm_email_cubit/confirm_email_cubit.dart';
import 'package:linkify_app/features/auth/presentation/view_model/confirm_email_cubit/confirm_email_state.dart';

class ConfirmEmailBody extends StatelessWidget {
  const ConfirmEmailBody({super.key});

  static String email = PrefsHelper.getString(key: PrefsKey.email);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConfirmEmailCubit, ConfirmEmailState>(
      listener: (context, state) {
        if (state is ConfirmEmailSuccess) {
          context.go(RoutesManager.kLogin);
        }
        if (state is ConfirmEmailFailure) {
          Fluttertoast.showToast(
              msg: "رمز التحقق غير صالح! يرجى التحقق من بريدك الإلكتروني والمحاولة مرة أخرى",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      child: ListView(
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
              hintStyle: Styles.textStyle18.copyWith(
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
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
            onSubmit: (String verificationCode) async {
              await context.read<ConfirmEmailCubit>().confirmEmail(
                    input: ConfirmEmailInputModel(
                      email: email,
                      otp: verificationCode,
                    ),
                  );
            },
          ),
        ],
      ),
    );
  }
}
