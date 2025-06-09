import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:linkify_app/core/constants.dart';
import 'package:linkify_app/core/prefs.dart';
import 'package:linkify_app/core/reusable_components/custom_auth_buttom.dart';
import 'package:linkify_app/core/reusable_components/custom_auth_text_form_filed.dart';
import 'package:linkify_app/core/utils/assets_manager.dart';
import 'package:linkify_app/core/utils/color_manager.dart';
import 'package:linkify_app/core/utils/routes.dart';
import 'package:linkify_app/core/utils/styles_manager.dart';
import 'package:linkify_app/features/auth/data/model/reset_password_input_model.dart';
import 'package:linkify_app/features/auth/presentation/view_model/reset_password_cubit.dart';
import 'package:linkify_app/features/auth/presentation/view_model/reset_password_state.dart';

class ResetPasswordBody extends StatefulWidget {
  const ResetPasswordBody({
    super.key,
  });

  @override
  State<ResetPasswordBody> createState() => _ResetPasswordBodyState();
}

class _ResetPasswordBodyState extends State<ResetPasswordBody> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool passwordObscureText = true;
  bool confirmPasswordObscureText = true;
  late String otp;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(
      text: PrefsHelper.getString(key: PrefsKey.email),
    );
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          padding: REdgeInsets.symmetric(
            horizontal: 25,
            vertical: 25,
          ),
          children: [
            Image.asset(
              AssetsManager.resetPasswordGif,
              width: double.infinity,
              height: 377.h,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 50.h),
            Align(
              alignment: Alignment.center,
              child: Text(
                "OTP",
                style: Styles.textStyle20.copyWith(
                  color: const Color(0xff000000).withOpacity(0.7),
                ),
              ),
            ),
            SizedBox(height: 10.h),
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
              onSubmit: (String verificationCode) {
                otp = verificationCode;
              },
            ),
            SizedBox(height: 30.h),
            CustomAuthTextFormFiled(
              titleText: "عنوان البريد الإلكتروني",
              readOnly: true,
              hintText: emailController.text,
              prefixIcon: const Icon(Icons.email_outlined),
              textInputType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              controller: emailController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "يرجى إدخال عنوان البريد الإلكتروني";
                } else if (!(Constants.emailRegex).hasMatch(value)) {
                  return "رجى إدخال عنوان بريد إلكتروني صالح";
                }
                return null;
              },
              fillColor: ColorManager.mainColor,
              hintStyleColor: Colors.white,
              prefixIconColor: Colors.white,
              titleColor: const Color(0x00000000).withOpacity(0.7),
              textStyle: Colors.white,
            ),
            SizedBox(height: 30.h),
            CustomAuthTextFormFiled(
              titleText: "كلمة المرور الجديدة",
              hintText: "أدخل كلمة المرور الجديدة",
              prefixIcon: const Icon(Icons.lock_outlined),
              textInputType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              controller: passwordController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "يرجى إدخال كلمة المرور.";
                } else if (!(Constants.passwordRegex).hasMatch(value)) {
                  return "يجب أن تتكون كلمة المرور من 8 أحرف على الأقل، وتحتوي على حرف كبير، ورقم، ورمز خاص";
                }
                return null;
              },
              fillColor: ColorManager.mainColor,
              hintStyleColor: Colors.white,
              prefixIconColor: Colors.white,
              titleColor: const Color(0x00000000).withOpacity(0.7),
              textStyle: Colors.white,
              obscureText: passwordObscureText,
              suffixIcon: IconButton(
                onPressed: () {
                  passwordObscureText = !passwordObscureText;
                  setState(() {});
                },
                icon: passwordObscureText
                    ? const Icon(Icons.visibility_off_outlined)
                    : const Icon(Icons.visibility_outlined),
                color: Colors.white,
              ),
            ),
            SizedBox(height: 30.h),
            CustomAuthTextFormFiled(
              titleText: "تأكيد كلمة المرور",
              hintText: "أعد إدخال كلمة المرور الجديدة",
              prefixIcon: const Icon(Icons.lock_outlined),
              textInputType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              validator: (value) {
                if (value!.isEmpty) {
                  return "يرجى تأكيد كلمة المرور";
                } else if (!(Constants.passwordRegex).hasMatch(value)) {
                  return "يجب أن تتكون كلمة المرور من 8 أحرف على الأقل، وتحتوي على حرف كبير، ورقم، ورمز خاص";
                } else if (value != passwordController.text) {
                  return "كلمتا المرور غير متطابقتين";
                }
                return null;
              },
              fillColor: ColorManager.mainColor,
              hintStyleColor: Colors.white,
              controller: confirmPasswordController,
              prefixIconColor: Colors.white,
              titleColor: const Color(0x00000000).withOpacity(0.7),
              textStyle: Colors.white,
              obscureText: confirmPasswordObscureText,
              suffixIcon: IconButton(
                onPressed: () {
                  confirmPasswordObscureText = !confirmPasswordObscureText;
                  setState(() {});
                },
                icon: confirmPasswordObscureText
                    ? const Icon(Icons.visibility_off_outlined)
                    : const Icon(Icons.visibility_outlined),
                color: Colors.white,
              ),
            ),
            SizedBox(height: 50.h),
            BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
              listener: (context, state) {
                if (state is ResetPasswordSuccess) {
                  Fluttertoast.showToast(
                    msg: "تم تغيير كلمة المرور بنجاح",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                  context.go(RoutesManager.kLogin);
                }
                if (state is ResetPasswordFailure) {
                  Fluttertoast.showToast(
                    msg: state.error,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                }
              },
              builder: (context, state) {
                if (state is ResetPasswordLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.mainColor,
                    ),
                  );
                }
                return CustomAuthButton(
                  onTap: () {
                    if (formKey.currentState?.validate() ?? false) {
                      context.read<ResetPasswordCubit>().resetPassword(
                            input: ResetPasswordInputModel(
                              password: passwordController.text,
                              otp: otp,
                              email: emailController.text,
                            ),
                          );
                    }
                  },
                  buttonTitle: "إرسال",
                  backgroundColor: ColorManager.mainColor,
                  buttonTitleColor: Colors.white,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
