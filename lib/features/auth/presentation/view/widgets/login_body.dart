import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:linkify_app/core/constants.dart';
import 'package:linkify_app/core/reusable_components/custom_auth_buttom.dart';
import 'package:linkify_app/core/reusable_components/custom_auth_text_form_filed.dart';
import 'package:linkify_app/core/utils/assets_manager.dart';
import 'package:linkify_app/core/utils/routes.dart';
import 'package:linkify_app/core/utils/strings_manager.dart';
import 'package:linkify_app/core/utils/styles_manager.dart';
import 'package:linkify_app/features/auth/data/model/login_input_model.dart';
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
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
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
            titleText: "E-mail address",
            hintText: "enter your email address",
            prefixIcon: const Icon(Icons.email_outlined),
            textInputType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            controller: emailController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter your email address";
              } else if (!(Constants.emailRegex).hasMatch(value)) {
                return "Please enter a valid email address";
              }
              return null;
            },
          ),
          SizedBox(height: 30.h),
          CustomAuthTextFormFiled(
            titleText: "Password",
            hintText: "enter your password",
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
                return "Please enter your password.";
              } else if (!(Constants.passwordRegex).hasMatch(value)) {
                return "Password must be at least 8 characters long, include an uppercase letter, a number, and a special character";
              }
              return null;
            },
          ),
          SizedBox(height: 15.h),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                context.push(RoutesManager.kForgetPassword);
              },
              child: Text(
                "Forgot password",
                style: Styles.textStyle18.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 50.h),
          BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                Fluttertoast.showToast(
                  msg: "Login successful",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
                context.go(RoutesManager.kHome);
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
                buttonTitle: "Sign up",
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
              Text("Don’t have an account?", style: Styles.textStyle18),
              TextButton(
                onPressed: () {
                  context.push(RoutesManager.kSignUp);
                },
                child: Text(
                  "Create Account",
                  style: Styles.textStyle18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
