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
import 'package:linkify_app/core/utils/strings_manager.dart';
import 'package:linkify_app/core/utils/styles_manager.dart';
import 'package:linkify_app/features/auth/data/model/login_input_model.dart';
import 'package:linkify_app/features/auth/presentation/view_model/create_new_customer_cubit/create_new_customer_cubit.dart';
import 'package:linkify_app/features/auth/presentation/view_model/create_new_customer_cubit/create_new_customer_state.dart';
import 'package:linkify_app/features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:linkify_app/features/auth/presentation/view_model/login_cubit/login_state.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    context.read<CreateNewCustomerCubit>().createNewCustomer();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  bool obscureText = true;

  String selectedRole = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: BlocListener<CreateNewCustomerCubit, CreateNewCustomerState>(
          listener: (context, state) {
            if (state is CreateNewCustomerSuccess) {
              PrefsHelper.setString(
                  key: PrefsKey.customerId,
                  value: state.createNewCustomerStripeResponse.id ?? "");
            }
            if (state is CreateNewCustomerFailure) {
              print("Error create newCuromer    ${state.error}");
            }
          },
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
              Text(
                StringsManager.welcomeTextLogin,
                style: Styles.textStyle24.copyWith(
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                StringsManager.welcomeTextTitleLogin,
                style: Styles.textStyle16,
              ),
              SizedBox(height: 40.h),
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
                textInputAction: TextInputAction.done,
                controller: passwordController,
                suffixIcon: IconButton(
                  onPressed: () {
                    obscureText = !obscureText;
                    setState(() {});
                  },
                  icon: obscureText
                      ? const Icon(Icons.visibility_off_outlined)
                      : const Icon(Icons.visibility_outlined),
                ),
                obscureText: obscureText,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "يرجى إدخال كلمة المرور.";
                  } else if (!(Constants.passwordRegex).hasMatch(value)) {
                    return "يجب أن تكون كلمة المرور 8 أحرف على الأقل، تحتوي على حرف كبير، رقم، ورمز خاص";
                  }
                  return null;
                },
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    context.push(RoutesManager.kForgetPassword);
                  },
                  child: Text(
                    "نسيت كلمة المرور",
                    style: Styles.textStyle18.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
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
              BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccess) {
                    BlocProvider.of<CreateNewCustomerCubit>(context)
                        .createNewCustomer();
                    PrefsHelper.setToken(
                        key: PrefsKey.token,
                        token:
                            state.loginResponseModel.data?.accessToken ?? '');
                    PrefsHelper.setString(
                      key: PrefsKey.email,
                      value: emailController.text,
                    );
                    Fluttertoast.showToast(
                      msg: "تم تسجيل الدخول بنجاح",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                    PrefsHelper.getString(key: PrefsKey.role) == "admin"
                        ? context.go(RoutesManager.kAdmin)
                        : context.go(RoutesManager.kHome);
                  }
                  if (state is LoginFailure) {
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
                  if (state is LoginLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  }
                  return CustomAuthButton(
                    buttonTitle: "تسجيل الدخول",
                    onTap: () async {
                      if (formKey.currentState?.validate() ?? false) {
                        await context.read<LoginCubit>().login(
                              input: LoginInputModel(
                                email: emailController.text,
                                password: passwordController.text,
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
                  Text("ليس لديك حساب؟", style: Styles.textStyle18),
                  TextButton(
                    onPressed: () {
                      context.push(RoutesManager.kSignUp);
                    },
                    child: Text(
                      "إنشاء حساب",
                      style: Styles.textStyle18,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
