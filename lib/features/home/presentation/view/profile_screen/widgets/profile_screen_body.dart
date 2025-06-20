import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:linkify_app/core/constants.dart';
import 'package:linkify_app/core/prefs.dart';
import 'package:linkify_app/core/reusable_components/custom_auth_buttom.dart';
import 'package:linkify_app/core/reusable_components/custom_auth_text_form_filed.dart';
import 'package:linkify_app/core/reusable_components/failure_state_widget.dart';
import 'package:linkify_app/core/utils/assets_manager.dart';
import 'package:linkify_app/core/utils/color_manager.dart';
import 'package:linkify_app/core/utils/routes.dart';
import 'package:linkify_app/core/utils/styles_manager.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_profile_cubit/get_profile_cubit.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_profile_cubit/get_profile_state.dart';
import 'package:linkify_app/features/home/presentation/view_model/update_profile_cubit/update_profile_cubit.dart';
import 'package:linkify_app/features/home/presentation/view_model/update_profile_cubit/update_profile_state.dart';
import 'package:linkify_app/features/payment/presentation/view_model/get_order_details/get_order_details_cubit.dart';
import 'package:linkify_app/features/payment/presentation/view_model/get_order_details/get_order_details_state.dart';

class ProfileScreenBody extends StatefulWidget {
  const ProfileScreenBody({super.key});

  @override
  State<ProfileScreenBody> createState() => _ProfileScreenBodyState();
}

class _ProfileScreenBodyState extends State<ProfileScreenBody> {
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController nameController;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isNavigated = false;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();

    context.read<GetProfileCubit>().getProfile(
          token: PrefsHelper.getToken(key: PrefsKey.token),
          role: PrefsHelper.getString(key: PrefsKey.role) == "admin"
              ? "System"
              : "Bearer",
        );
  }

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 25),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          children: [
            Image.asset(
              width: double.infinity,
              AssetsManager.profile,
            ),
            Center(
              child: BlocConsumer<GetProfileCubit, GetProfileState>(
                listener: (context, state) {
                  if (state is GetProfileSuccess) {
                    emailController.text =
                        state.getProfileResponse.data?.user?.email ?? '';
                    nameController.text =
                        state.getProfileResponse.data?.user?.username ?? '';
                    phoneController.text =
                        state.getProfileResponse.data?.user?.phone ?? '';
                  }
                },
                builder: (context, state) {
                  if (state is GetProfileSuccess) {
                    return Form(
                      key: formKey,
                      child: ListView(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          CustomAuthTextFormFiled(
                            readOnly: true,
                            titleText: "عنوان البريد الإلكتروني",
                            hintText: "أدخل عنوان بريدك الإلكتروني",
                            prefixIcon: Icon(Icons.email_outlined),
                            textInputType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            fillColor: ColorManager.mainColor,
                            textStyle: ColorManager.texColor,
                            hintStyleColor: ColorManager.mainColor,
                            titleColor: ColorManager.texColor,
                            prefixIconColor: Colors.white,
                            controller: emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "يرجى إدخال عنوان البريد الإلكتروني";
                              } else if (!(Constants.emailRegex)
                                  .hasMatch(value)) {
                                return "يرجى إدخال عنوان بريد إلكتروني صالح";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 25.h),
                          CustomAuthTextFormFiled(
                            titleText: "أسم المستخدم",
                            hintText: "ادخل اسم المستخدم",
                            prefixIcon: Icon(Icons.person_outline),
                            textInputType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            fillColor: ColorManager.mainColor,
                            textStyle: ColorManager.texColor,
                            hintStyleColor: ColorManager.mainColor,
                            titleColor: ColorManager.texColor,
                            prefixIconColor: Colors.white,
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.edit_outlined,
                                color: Colors.white,
                              ),
                            ),
                            controller: nameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "يرجى إدخال اسمك الكامل";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 25.h),
                          CustomAuthTextFormFiled(
                            titleText: "رقم الجوال",
                            hintText: "أدخل رقم جوالك",
                            prefixIcon: Icon(Icons.phone_outlined),
                            textInputType: TextInputType.phone,
                            textInputAction: TextInputAction.done,
                            fillColor: ColorManager.mainColor,
                            textStyle: ColorManager.texColor,
                            hintStyleColor: ColorManager.mainColor,
                            titleColor: ColorManager.texColor,
                            prefixIconColor: Colors.white,
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.edit_outlined,
                                color: Colors.white,
                              ),
                            ),
                            controller: phoneController,
                            maxLength: 11,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "يرجى إدخال رقم جوالك";
                              } else if (!(Constants.phoneRegex)
                                  .hasMatch(value)) {
                                return "يرجى إدخال رقم جوال صحيح";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 50.h),
                          BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
                            listener: (context, updateState) {
                              if (updateState is UpdateProfileSuccess) {
                                Fluttertoast.showToast(
                                    msg: "تم تعديل البيانات بنجاح",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                            },
                            builder: (context, updateState) {
                              if (updateState is UpdateProfileSuccess) {
                                return CustomAuthButton(
                                  buttonTitle: "تعديل",
                                  backgroundColor: ColorManager.mainColor,
                                  buttonTitleColor: Colors.white,
                                  onTap: () {
                                    if (formKey.currentState?.validate() ??
                                        false) {
                                      context
                                          .read<UpdateProfileCubit>()
                                          .updateProfile(
                                            token: PrefsHelper.getToken(
                                                key: PrefsKey.token),
                                            role: PrefsHelper.getString(
                                                        key: PrefsKey.role) ==
                                                    "admin"
                                                ? "System"
                                                : "Bearer",
                                            name: nameController.text,
                                            phone: phoneController.text,
                                          );
                                    }
                                  },
                                );
                              } else if (updateState is UpdateProfileFailure) {
                                return FailureStateWidget(
                                    errorMessage: updateState.error);
                              } else if (updateState is UpdateProfileLoading) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: ColorManager.mainColor,
                                  ),
                                );
                              } else {
                                return CustomAuthButton(
                                  buttonTitle: "تعديل",
                                  backgroundColor: ColorManager.mainColor,
                                  buttonTitleColor: Colors.white,
                                  onTap: () {
                                    if (formKey.currentState?.validate() ??
                                        false) {
                                      context
                                          .read<UpdateProfileCubit>()
                                          .updateProfile(
                                            token: PrefsHelper.getToken(
                                                key: PrefsKey.token),
                                            role: PrefsHelper.getString(
                                                        key: PrefsKey.role) ==
                                                    "admin"
                                                ? "System"
                                                : "Bearer",
                                            name: nameController.text,
                                            phone: phoneController.text,
                                          );
                                    }
                                  },
                                );
                              }
                            },
                          ),
                          SizedBox(height: 30.h),
                          Row(
                            children: [
                              Expanded(
                                child: BlocConsumer<GetOrderDetailsCubit,
                                    GetOrderDetailsState>(
                                  listener: (context, orderState) {
                                    if (orderState is GetOrderDetailsSuccess &&
                                        !isNavigated) {
                                      isNavigated = true;
                                      context.push(
                                        RoutesManager.kOrderScreen,
                                        extra: orderState.orderId,
                                      );
                                    }
                                  },
                                  builder: (context, orderState) {
                                    if (orderState is GetOrderDetailsFailure) {
                                      return FailureStateWidget(
                                          errorMessage: orderState.error);
                                    } else {
                                      return CustomAuthButton(
                                        buttonTitle: "عرض الطلب",
                                        backgroundColor: ColorManager.mainColor,
                                        buttonTitleColor: Colors.white,
                                        onTap: () {
                                          context
                                              .read<GetOrderDetailsCubit>()
                                              .getOrderDetails(
                                                orderId: PrefsHelper.getString(
                                                    key: PrefsKey.orderId),
                                                token: PrefsHelper.getToken(
                                                    key: PrefsKey.token),
                                              );
                                        },
                                      );
                                    }
                                  },
                                ),
                              ),
                              SizedBox(width: 25.w),
                              Expanded(
                                child: SizedBox(
                                  height: 65.h,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      context.go(RoutesManager.kLogin);
                                      PrefsHelper.removeToken(
                                          key: PrefsKey.token);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                      ),
                                    ),
                                    child: Text(
                                      "تسجيل خروج",
                                      style: Styles.textStyle20
                                          .copyWith(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30.h),
                          Expanded(
                            child: SizedBox(
                              height: 65.h,
                              child: ElevatedButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(25.r),
                                      ),
                                    ),
                                    builder: (context) {
                                      return Padding(
                                        padding: REdgeInsets.symmetric(vertical: 20,horizontal: 30),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                                Container(
                                                  height: 60.h,
                                                  decoration: BoxDecoration(
                                                    color: ColorManager
                                                        .mainColor,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(25.r),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Icon(
                                                        Icons.email_outlined,
                                                        color: Colors.white,
                                                      ),
                                                      SizedBox(width: 5.w),
                                                      Text(
                                                        "Linkify4@gmail.com",
                                                        style: Styles
                                                            .textStyle18
                                                            .copyWith(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 20.h),
                                                Container(
                                                  height: 60.h,
                                                  decoration: BoxDecoration(
                                                    color: ColorManager
                                                        .mainColor,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(25.r),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Icon(
                                                        Icons.phone_outlined,
                                                        color: Colors.white,
                                                      ),
                                                      SizedBox(width: 5.w),
                                                      Text(
                                                        "01277512154",
                                                        style: Styles
                                                            .textStyle18
                                                            .copyWith(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                  ),
                                ),
                                child: Text(
                                  "تواصل معنا",
                                  style: Styles.textStyle20
                                      .copyWith(color: ColorManager.mainColor),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 50.h),
                        ],
                      ),
                    );
                  } else if (state is GetProfileFailure) {
                    return FailureStateWidget(errorMessage: state.error);
                  } else {
                    return Center(
                        child: CircularProgressIndicator(
                      color: ColorManager.mainColor,
                    ));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
