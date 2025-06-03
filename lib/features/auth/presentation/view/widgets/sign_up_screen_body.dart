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
import 'package:linkify_app/core/utils/routes.dart';
import 'package:linkify_app/core/utils/styles_manager.dart';
import 'package:linkify_app/features/auth/data/model/sign_up_input_model.dart';
import 'package:linkify_app/features/auth/presentation/view_model/create_new_customer_cubit/create_new_customer_cubit.dart';
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
            titleText: "Full Name",
            hintText: "enter your full name",
            prefixIcon: const Icon(Icons.person_outline),
            textInputType: TextInputType.name,
            textInputAction: TextInputAction.next,
            controller: nameController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter your full name";
              }
              return null;
            },
          ),
          SizedBox(height: 30.h),
          CustomAuthTextFormFiled(
            titleText: "Mobile Number",
            hintText: "enter your mobile no.",
            prefixIcon: const Icon(Icons.phone_outlined),
            textInputType: TextInputType.phone,
            textInputAction: TextInputAction.next,
            controller: phoneController,
            maxLength: 11,
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter your mobile number";
              } else if (!(Constants.phoneRegex).hasMatch(value)) {
                return "Please enter a valid mobile number";
              }
              return null;
            },
          ),
          SizedBox(height: 30.h),
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
                return "Please enter your password.";
              } else if (!(Constants.passwordRegex).hasMatch(value)) {
                return "Password must be at least 8 characters long, include an uppercase letter, a number, and a special character";
              }
              return null;
            },
          ),
          SizedBox(height: 30.h),
          CustomAuthTextFormFiled(
            titleText: "Confirm Password",
            hintText: "Re-enter your password",
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
                return "Please confirm your password";
              } else if (!(Constants.passwordRegex).hasMatch(value)) {
                return "Password must be at least 8 characters long, include an uppercase letter, a number, and a special character";
              } else if (value != passwordController.text) {
                return "Passwords do not match";
              }
              return null;
            },
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
                buttonTitle: "Sign up",
                onTap: () async {
                  if (formKey.currentState?.validate() ?? false) {
                    await BlocProvider.of<SignUpCubit>(context).signUp(
                      input: SignUpInputModel(
                        emailController.text,
                        nameController.text,
                        passwordController.text,
                        confirmPasswordController.text,
                        phoneController.text,
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
              Text("Already have an account?", style: Styles.textStyle18),
              TextButton(
                onPressed: () {
                  context.push(RoutesManager.kLogin);
                },
                child: Text(
                  "Login",
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
