import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:linkify_app/core/prefs.dart';
import 'package:linkify_app/core/utils/assets_manager.dart';
import 'package:linkify_app/core/utils/color_manager.dart';
import 'package:linkify_app/core/utils/styles_manager.dart';
import 'package:linkify_app/features/payment/data/model/get_order_details/GetOrderDetails.dart';

class SuccessfulPaymentContainer extends StatelessWidget {
  const SuccessfulPaymentContainer({
    super.key,
    required this.detailsResponse,
  });

  final GetOrderDetailsResponse detailsResponse;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 35.r, right: 35.r, left: 35.r),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Colors.grey.shade200,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 26.h),
          Text(
            "شكراً لك!",
            style: Styles.textStyle25,
          ),
          Text(
            "تمت العملية بنجاح",
            style: Styles.textStyle20.copyWith(
              color: ColorManager.texColor.withOpacity(0.8),
            ),
          ),
          SizedBox(height: 42.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                () {
                  String isoString = detailsResponse.data?.createdAt ?? "";
                  DateTime dateTime = DateTime.parse(isoString).toLocal();
                  String formattedDate =
                      "${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year}";
                  return formattedDate;
                }(),
                style:
                    Styles.textStyle18.copyWith(color: ColorManager.texColor),
              ),
              Text(
                "التاريــــخ",
                style:
                    Styles.textStyle18.copyWith(color: ColorManager.texColor),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat('hh:mm a').format(
                    DateTime.parse(detailsResponse.data?.createdAt ?? "")
                        .toLocal()),
                // Output: 04:06 AM (you can change format as needed)
                style:
                    Styles.textStyle18.copyWith(color: ColorManager.texColor),
              ),
              Text(
                "الــــــوقت",
                style:
                    Styles.textStyle18.copyWith(color: ColorManager.texColor),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                () {
                  String isoString = detailsResponse.data?.deliveryDate ?? "";
                  DateTime dateTime = DateTime.parse(isoString).toLocal();
                  String formattedDate =
                      "${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year}";
                  return formattedDate;
                }(),
                style:
                    Styles.textStyle18.copyWith(color: ColorManager.texColor),
              ),
              Text(
                "تاريخ التوصيل",
                style:
                    Styles.textStyle18.copyWith(color: ColorManager.texColor),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                detailsResponse.data?.shippingAddress?.recipientName ?? "",
                style:
                    Styles.textStyle18.copyWith(color: ColorManager.texColor),
              ),
              Text(
                "المستــــلم",
                style:
                    Styles.textStyle18.copyWith(color: ColorManager.texColor),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                detailsResponse.data?.shippingAddress?.phone ?? "",
                style:
                    Styles.textStyle18.copyWith(color: ColorManager.texColor),
              ),
              Text(
                "رقم الهاتف",
                style:
                    Styles.textStyle18.copyWith(color: ColorManager.texColor),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                detailsResponse.data?.shippingAddress?.location ?? "",
                style:
                    Styles.textStyle18.copyWith(color: ColorManager.texColor),
              ),
              Text(
                "مكان التوصيل",
                style:
                    Styles.textStyle18.copyWith(color: ColorManager.texColor),
              ),
            ],
          ),
          SizedBox(height: 30.h),
          Divider(
            thickness: 1.5,
            color: Colors.grey[500],
          ),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${PrefsHelper.getString(key: PrefsKey.totalAmount)} ج.م",
                style: Styles.textStyle24.copyWith(
                  color: ColorManager.texColor,
                ),
              ),
              Text(
                "الإجمالى",
                style: Styles.textStyle24.copyWith(
                  color: ColorManager.texColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  width: 35.w,
                  height: 21.h,
                  AssetsManager.masterCardLogo,
                ),
                //SizedBox(width: 25.w),
                Text(
                  "Credit Card Mastercard **78 ",
                  style:
                      Styles.textStyle18.copyWith(color: ColorManager.texColor),
                ),
              ],
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                FontAwesomeIcons.barcode,
                size: 70.sp,
              ),
              detailsResponse.data?.paymentMethod == "credit_card"
                  ? Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green, width: 2),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.r, vertical: 15.r),
                        child: Text(
                          "تم الدفع",
                          style:
                              Styles.textStyle24.copyWith(color: Colors.green),
                        ),
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red, width: 2),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.r, vertical: 15.r),
                        child: Text(
                          "الدفع عند الاستلام",
                          style: Styles.textStyle24.copyWith(color: Colors.red),
                        ),
                      ),
                    ),
            ],
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.20 / 2 - 15.h)
        ],
      ),
    );
  }
}
