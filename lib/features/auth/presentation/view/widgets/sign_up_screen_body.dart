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
import 'package:linkify_app/core/utils/styles_manager.dart';
import 'package:linkify_app/features/auth/data/model/sign_up_input_model.dart';
import 'package:linkify_app/features/auth/presentation/view_model/sign_up_cubit/sign_up_cubit.dart';
import 'package:linkify_app/features/auth/presentation/view_model/sign_up_cubit/sign_up_state.dart';

class SignUpScreenBody extends StatefulWidget {
  const SignUpScreenBody({super.key});

  @override
  State<SignUpScreenBody> createState() => _SignUpScreenBodyState();
}

class _SignUpScreenBodyState extends State<SignUpScreenBody> {
  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool passwordObscureText = true;
  bool confirmPasswordObscureText = true;

  String selectedRole = "";

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
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
            vertical: 30,
          ),
          children: [
            Center(
              child: Image.asset(
                width: 230.w,
                height: 70.h,
                AssetsManager.linkifyLogoTrans,
              ),
            ),
            SizedBox(height: 45.h),
            CustomAuthTextFormFiled(
              titleText: "الاسم الكامل",
              hintText: "أدخل اسمك الكامل",
              prefixIcon: const Icon(Icons.person_outline),
              textInputType: TextInputType.name,
              textInputAction: TextInputAction.next,
              controller: nameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "يرجى إدخال اسمك الكامل";
                }
                return null;
              },
            ),
            SizedBox(height: 30.h),
            CustomAuthTextFormFiled(
              titleText: "رقم الجوال",
              hintText: "أدخل رقم جوالك",
              prefixIcon: const Icon(Icons.phone_outlined),
              textInputType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              controller: phoneController,
              maxLength: 11,
              validator: (value) {
                if (value!.isEmpty) {
                  return "يرجى إدخال رقم جوالك";
                } else if (!(Constants.phoneRegex).hasMatch(value)) {
                  return "يرجى إدخال رقم جوال صحيح";
                }
                return null;
              },
            ),
            SizedBox(height: 30.h),
            CustomAuthTextFormFiled(
              titleText: "عنوان البريد الإلكتروني",
              hintText: "أدخل عنوان بريدك الإلكتروني",
              prefixIcon: const Icon(Icons.email_outlined),
              textInputType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              controller: emailController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "يرجى إدخال عنوان البريد الإلكتروني";
                } else if (!(Constants.emailRegex).hasMatch(value)) {
                  return "يرجى إدخال عنوان بريد إلكتروني صالح";
                }
                return null;
              },
            ),
            SizedBox(height: 30.h),
            CustomAuthTextFormFiled(
              titleText: "كلمة المرور",
              hintText: "أدخل كلمة المرور",
              prefixIcon: const Icon(Icons.lock_outlined),
              textInputType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              obscureText: passwordObscureText,
              suffixIcon: IconButton(
                onPressed: () {
                  passwordObscureText = !passwordObscureText;
                  setState(() {});
                },
                icon: passwordObscureText
                    ? const Icon(Icons.visibility_off_outlined)
                    : const Icon(Icons.visibility_outlined),
              ),
              controller: passwordController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "يرجى إدخال كلمة المرور.";
                } else if (!(Constants.passwordRegex).hasMatch(value)) {
                  return "يجب أن تكون كلمة المرور 8 أحرف على الأقل، تحتوي على حرف كبير، رقم، ورمز خاص";
                }
                return null;
              },
            ),
            SizedBox(height: 30.h),
            CustomAuthTextFormFiled(
              titleText: "تأكيد كلمة المرور",
              hintText: "أعد إدخال كلمة المرور",
              prefixIcon: const Icon(Icons.lock_outlined),
              textInputType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              obscureText: confirmPasswordObscureText,
              suffixIcon: IconButton(
                onPressed: () {
                  confirmPasswordObscureText = !confirmPasswordObscureText;
                  setState(() {});
                },
                icon: confirmPasswordObscureText
                    ? const Icon(Icons.visibility_off_outlined)
                    : const Icon(Icons.visibility_outlined),
              ),
              controller: confirmPasswordController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "يرجى تأكيد كلمة المرور";
                } else if (!(Constants.passwordRegex).hasMatch(value)) {
                  return "يجب أن تكون كلمة المرور 8 أحرف على الأقل، تحتوي على حرف كبير، رقم، ورمز خاص";
                } else if (value != passwordController.text) {
                  return "كلمتا المرور غير متطابقتين";
                }
                return null;
              },
            ),
            SizedBox(height: 50.h),
            Text(
              "من فضلك اختر نوع المستخدم الذي سيستعمل التطبيق",
              textAlign: TextAlign.center,
              style: Styles.textStyle18.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    selectedRole = "admin";
                    PrefsHelper.setString(key: PrefsKey.role, value: "admin");
                    setState(() {});
                  },
                  child: Container(
                    width: 100.w,
                    height: 120.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.r)),
                      color: Colors.white,
                      border: selectedRole == "admin"
                          ? Border.all(color: Colors.green, width: 3.w)
                          : null,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          width: 80.w,
                          AssetsManager.company2,
                        ),
                        SizedBox(height: 10),
                        Expanded(
                          child: Text(
                            "شركة",
                            style: Styles.textStyle16.copyWith(
                              color: ColorManager.texColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    selectedRole = "user";
                    PrefsHelper.setString(key: PrefsKey.role, value: "user");
                    setState(() {});
                  },
                  child: Container(
                    width: 100.w,
                    height: 120.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.r)),
                      color: Colors.white,
                      border: selectedRole == "user"
                          ? Border.all(color: Colors.green, width: 3.w)
                          : null,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          width: 80.w,
                          AssetsManager.merchant,
                        ),
                        SizedBox(height: 10),
                        Expanded(
                          child: Text(
                            "تاجر",
                            style: Styles.textStyle16.copyWith(
                              color: ColorManager.texColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50.h),
            BlocConsumer<SignUpCubit, SignUpState>(
              listener: (context, state) {
                if (state is SignUpSuccess) {
                  Fluttertoast.showToast(
                    msg: "Account created successful! Welcome 🎉",
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
                  PrefsHelper.setString(
                    key: PrefsKey.phone,
                    value: phoneController.text,
                  );
                  PrefsHelper.setString(
                    key: PrefsKey.password,
                    value: passwordController.text,
                  );
                  PrefsHelper.setString(
                    key: PrefsKey.name,
                    value: nameController.text,
                  );
                  context.push(
                    RoutesManager.kConfirmEmail,
                  );
                }
                if (state is SignUpFailure) {
                  print("error ====> ${state.errorMessage}");
                  Fluttertoast.showToast(
                    msg: state.errorMessage,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                }
              },
              builder: (context, state) {
                if (state is SignUpLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                }
                return CustomAuthButton(
                  buttonTitle: "إنشاء حساب",
                  onTap: () async {
                    if (formKey.currentState?.validate() ?? false) {
                      await BlocProvider.of<SignUpCubit>(context).signUp(
                        input: SignUpInputModel(
                          emailController.text,
                          nameController.text,
                          passwordController.text,
                          confirmPasswordController.text,
                          phoneController.text,
                          PrefsHelper.getString(key: PrefsKey.role),
                        ),
                      );
                    }
                  },
                );
              },
            ),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("هل لديك حساب بالفعل؟", style: Styles.textStyle18),
                TextButton(
                  onPressed: () {
                    context.push(RoutesManager.kLogin);
                  },
                  child: Text(
                    "تسجيل الدخول",
                    style: Styles.textStyle18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
