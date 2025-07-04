import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:linkify_app/features/auth/presentation/view_model/forget_cubit/forget_password_cubit.dart';
import 'package:linkify_app/features/auth/presentation/view_model/forget_cubit/forget_password_state.dart';

class ForgetPasswordBody extends StatefulWidget {
  const ForgetPasswordBody({super.key});

  @override
  State<ForgetPasswordBody> createState() => _ForgetPasswordBodyState();
}

class _ForgetPasswordBodyState extends State<ForgetPasswordBody> {
  late TextEditingController emailController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
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
              AssetsManager.forgetPasswordGif,
              width: double.infinity,
              height: 377.h,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 100.h),
            CustomAuthTextFormFiled(
              titleText: "عنوان البريد الإلكتروني",
              hintText: "أدخل عنوان بريدك الإلكتروني",
              prefixIcon: const Icon(Icons.email_outlined),
              textInputType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              controller: emailController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "يرجى إدخال عنوان البريد الإلكتروني";
                } else if (!(Constants.emailRegex).hasMatch(value)) {
                  return "يرجى إدخال عنوان بريد إلكتروني صالح";
                }
                return null;
              },
              fillColor: ColorManager.mainColor,
              hintStyleColor: Colors.white,
              prefixIconColor: Colors.white,
              titleColor: const Color(0x00000000).withOpacity(0.7),
              textStyle: Colors.white,
            ),
            SizedBox(height: 50.h),
            BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
              listener: (context, state) {
                if (state is ForgetPasswordSuccess) {
                  Fluttertoast.showToast(
                    msg:
                        "تم إرسال رمز التحقق إلى بريدك الإلكتروني. يرجى التحقق من صندوق الوارد (وأيضًا مجلد الرسائل غير المرغوب فيها)",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                  PrefsHelper.setString(
                    key: PrefsKey.email,
                    value: emailController.text,
                  );
                  context.go(
                    RoutesManager.kResetPassword,
                  );
                }
                if (state is ForgetPasswordFailure) {
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
                if (state is ForgetPasswordLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.mainColor,
                    ),
                  );
                }
                return CustomAuthButton(
                  onTap: () {
                    if (formKey.currentState?.validate() ?? false) {
                      context
                          .read<ForgetPasswordCubit>()
                          .forgetPassword(email: emailController.text);
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
