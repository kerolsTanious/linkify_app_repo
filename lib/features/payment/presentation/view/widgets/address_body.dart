import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:linkify_app/core/prefs.dart';
import 'package:linkify_app/core/utils/assets_manager.dart';
import 'package:linkify_app/core/utils/color_manager.dart';
import 'package:linkify_app/core/utils/routes.dart';
import 'package:linkify_app/core/utils/strings_manager.dart';
import 'package:linkify_app/core/utils/styles_manager.dart';
import 'package:linkify_app/features/payment/data/model/create_payment_intent_input.dart';
import 'package:linkify_app/features/payment/presentation/view_model/create_order_cubit/create_order_cubit.dart';
import 'package:linkify_app/features/payment/presentation/view_model/create_order_cubit/create_order_state.dart';
import 'package:linkify_app/features/payment/presentation/view_model/payment_cubit/payment_cubit.dart';
import 'package:linkify_app/features/payment/presentation/view_model/payment_cubit/payment_state.dart';
import 'package:linkify_app/features/payment/presentation/view_model/save_address_cubit/save_address_cubit.dart';
import 'package:linkify_app/features/payment/presentation/view_model/save_address_cubit/save_address_state.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/reusable_components/custom_auth_buttom.dart';
import '../../../../../core/reusable_components/custom_auth_text_form_filed.dart';

class AddressBody extends StatefulWidget {
  const AddressBody({super.key, required this.cartId});

  @override
  State<AddressBody> createState() => _AddressBodyState();
  final String cartId;
}

class _AddressBodyState extends State<AddressBody> {
  late TextEditingController phoneController;
  late TextEditingController recipientNameController;
  late TextEditingController locationController;
  late TextEditingController streetController;
  late TextEditingController notesController;
  String? selectedPaymentMethod;

  List<String> locations = [
    "القاهرة الجديدة",
    "مصر القديمة",
    "المقطم",
    "الشروق",
    "المستقبل",
    "المرج",
    "امبابة",
    "دقي",
    "المعادي",
    "حلوان",
    "العاصمة الادارية",
    "التجمع",
    "الزيتون",
    "وسط البلد",
    "مدينة نصر",
    "زمالك",
    "شبرا مصر",
    "مصر الجديدة",
    "مدينة بدر",
    "المهندسين",
    "عين شمس",
  ];

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController();
    recipientNameController = TextEditingController();
    locationController = TextEditingController();
    streetController = TextEditingController();
    notesController = TextEditingController();
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
              width: 350.w,
              AssetsManager.address,
            ),
          ),
          SizedBox(height: 45.h),
          CustomAuthTextFormFiled(
            titleText: StringsManager.recipientName,
            hintText: StringsManager.recipientNameHint,
            prefixIcon: const Icon(Icons.person_outline),
            textInputType: TextInputType.name,
            textInputAction: TextInputAction.next,
            controller: recipientNameController,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'الرجاء إدخال اسم المستلم';
              }
              return null;
            },
          ),
          SizedBox(height: 30.h),
          GestureDetector(
            onTap: () async {
              final selectedLocation = await showModalBottomSheet<String>(
                context: context,
                builder: (BuildContext context) {
                  return ListView.builder(
                    itemCount: locations.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(locations[index]),
                        onTap: () {
                          Navigator.pop(context, locations[index]);
                        },
                      );
                    },
                  );
                },
              );
              if (selectedLocation != null) {
                locationController.text = selectedLocation;
              }
            },
            child: AbsorbPointer(
              child: CustomAuthTextFormFiled(
                titleText: StringsManager.location,
                hintText: StringsManager.locationHint,
                prefixIcon: const Icon(Icons.location_city_outlined),
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.next,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.keyboard_arrow_down_outlined),
                ),
                controller: locationController,
                readOnly: true,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'الرجاء اختيار المنطقة';
                  }
                  return null;
                },
              ),
            ),
          ),
          SizedBox(height: 30.h),
          CustomAuthTextFormFiled(
            titleText: StringsManager.street,
            hintText: StringsManager.streetHint,
            prefixIcon: const Icon(Icons.location_city_outlined),
            textInputType: TextInputType.name,
            textInputAction: TextInputAction.next,
            controller: streetController,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'الرجاء إدخال اسم الشارع';
              }
              return null;
            },
          ),
          SizedBox(height: 30.h),
          CustomAuthTextFormFiled(
            titleText: StringsManager.phone,
            hintText: StringsManager.phoneHint,
            prefixIcon: const Icon(Icons.phone_outlined),
            textInputType: TextInputType.phone,
            textInputAction: TextInputAction.next,
            controller: phoneController,
            maxLength: 11,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'الرجاء إدخال رقم الهاتف';
              } else if (!(Constants.phoneRegex).hasMatch(value.trim())) {
                return 'رقم الهاتف غير صحيح';
              }
              return null;
            },
          ),
          SizedBox(height: 30.h),
          CustomAuthTextFormFiled(
            titleText: StringsManager.notes,
            hintText: StringsManager.notesHit,
            prefixIcon: const Icon(Icons.edit_note_sharp),
            textInputType: TextInputType.name,
            textInputAction: TextInputAction.done,
            controller: notesController,
            validator: (value) {},
          ),
          SizedBox(height: 50.h),
          BlocListener<SaveAddressCubit, SaveAddressState>(
            listener: (context, state) {
              if (state is SaveAddressSuccess) {
                showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.r),
                    ),
                  ),
                  builder: (context) {
                    return BlocListener<CreateOrderCubit, CreateOrderState>(
                      listener: (context, state) {
                        if (state is CreateOrderSuccess) {
                          if (selectedPaymentMethod == "cash_on_delivery") {
                            context.push(
                              RoutesManager.kOrderScreen,
                              extra: state.createOrderResponse.data?.id ?? "",
                            );
                          }
                          if (selectedPaymentMethod == "credit_card") {
                            PrefsHelper.setString(
                                key: PrefsKey.orderId,
                                value:
                                    state.createOrderResponse.data?.id ?? "");
                            BlocProvider.of<PaymentCubit>(context).payment(
                              input: CreatePaymentIntentInput(
                                amount: double.parse(PrefsHelper.getString(
                                        key: PrefsKey.totalAmount))
                                    .round(),
                                currency: "EGP",
                                customerId: PrefsHelper.getString(
                                    key: PrefsKey.customerId),
                              ),
                            );
                          }
                        }
                        if (state is CreateOrderFailure) {
                          Fluttertoast.showToast(
                            msg: state.errorMessage,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }
                      },
                      child: Padding(
                        padding: REdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'اختر طريقة الدفع',
                              style: Styles.textStyle20.copyWith(
                                color: ColorManager.texColor,
                              ),
                            ),
                            SizedBox(height: 16.h),
                            Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      BlocProvider.of<CreateOrderCubit>(context)
                                          .createOrder(
                                        token: PrefsHelper.getToken(
                                            key: PrefsKey.token),
                                        cartId: widget.cartId,
                                        paymentMethod: "cash_on_delivery",
                                      );
                                      selectedPaymentMethod =
                                          "cash_on_delivery";
                                    },
                                    child: Container(
                                      height: 60.h,
                                      decoration: BoxDecoration(
                                        color: ColorManager.mainColor,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(25.r),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(
                                            Icons.monetization_on_outlined,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "الدفع عند الاستلام",
                                            style: Styles.textStyle18.copyWith(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                BlocListener<PaymentCubit, PaymentState>(
                                  listener: (context, state) {
                                    if (state is PaymentSuccess) {
                                      context.go(
                                        RoutesManager.kOrderScreen,
                                        extra: PrefsHelper.getString(
                                            key: PrefsKey.orderId),
                                      );
                                    }
                                    if (state is PaymentFailure) {
                                      SnackBar snackBar = SnackBar(
                                        content: Text(
                                            state.error.error?.message ?? ""),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                  },
                                  child: Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        BlocProvider.of<CreateOrderCubit>(
                                                context)
                                            .createOrder(
                                          token: PrefsHelper.getToken(
                                              key: PrefsKey.token),
                                          cartId: widget.cartId,
                                          paymentMethod: "credit_card",
                                        );
                                        selectedPaymentMethod = "credit_card";
                                      },
                                      child: Container(
                                        height: 60.h,
                                        decoration: BoxDecoration(
                                          color: ColorManager.mainColor,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(25.r),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(
                                              Icons.credit_card_outlined,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              "الدفع بالبطاقة",
                                              style:
                                                  Styles.textStyle18.copyWith(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (state is SaveAddressFailure) {
                Fluttertoast.showToast(
                  msg: state.errorMessage,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              }
            },
            child: CustomAuthButton(
              buttonTitle: "انتقل إلى الدفع",
              onTap: () async {
                if (formKey.currentState?.validate() ?? false) {
                  BlocProvider.of<SaveAddressCubit>(context).saveAddress(
                    token: PrefsHelper.getToken(key: PrefsKey.token),
                    name: recipientNameController.text,
                    phone: phoneController.text,
                    street: streetController.text,
                    location: locationController.text,
                    notes: notesController.text,
                  );
                }
              },
            ),
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}
