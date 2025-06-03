import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkify_app/core/prefs.dart';
import 'package:linkify_app/features/payment/presentation/view/widgets/order_body.dart';
import 'package:linkify_app/features/payment/presentation/view_model/get_order_details/get_order_details_cubit.dart';

class Order extends StatefulWidget {
  const Order({super.key, required this.orderId});

  @override
  State<Order> createState() => _OrderState();

  final String orderId;
}

class _OrderState extends State<Order> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetOrderDetailsCubit>(context).getOrderDetails(
      token: PrefsHelper.getString(key: PrefsKey.token),
      orderId: widget.orderId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: OrderBody(),
      ),
    );
  }
}
