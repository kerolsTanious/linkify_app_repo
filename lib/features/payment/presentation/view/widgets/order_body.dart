import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:linkify_app/core/reusable_components/failure_state_widget.dart';
import 'package:linkify_app/core/utils/routes.dart';
import 'package:linkify_app/features/payment/presentation/view/widgets/order_container.dart';
import 'package:linkify_app/features/payment/presentation/view/widgets/seperated_line.dart';
import 'package:linkify_app/features/payment/presentation/view_model/get_order_details/get_order_details_cubit.dart';
import 'package:linkify_app/features/payment/presentation/view_model/get_order_details/get_order_details_state.dart';

class OrderBody extends StatelessWidget {
  const OrderBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetOrderDetailsCubit, GetOrderDetailsState>(
      builder: (context, state) {
        if (state is GetOrderDetailsSuccess) {
          return Padding(
            padding: EdgeInsets.only(
                right: 20.r, left: 20.r, bottom: 40.r, top: 60.r),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                SuccessfulPaymentContainer(detailsResponse: state.getOrderDetailsResponse,),
                Positioned(
                  left: -20.r,
                  bottom: MediaQuery.sizeOf(context).height * 0.20,
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                  ),
                ),
                Positioned(
                  right: -20.r,
                  bottom: MediaQuery.sizeOf(context).height * 0.20,
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                  ),
                ),
                Positioned(
                  right: 0,
                  left: 0,
                  bottom: MediaQuery.sizeOf(context).height * 0.20 + 20,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 40.r),
                    width: double.infinity,
                    child: const MySeparator(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: -50.r,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[200],
                    child: const CircleAvatar(
                      radius: 40,
                      backgroundColor: Color(0xff34A853),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 60,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 330.r,
                  child: IconButton(
                    onPressed: () {
                      context.go(RoutesManager.kCartScreen);
                    },
                    icon: Icon(
                      Icons.arrow_back_outlined,
                      size: 35.sp,
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (state is GetOrderDetailsFailure) {
          return FailureStateWidget(errorMessage: state.error);
        } else {
          return SizedBox();
        }
      },
    );
  }
}
