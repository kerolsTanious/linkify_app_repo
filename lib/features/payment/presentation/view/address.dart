import 'package:flutter/material.dart';
import 'package:linkify_app/core/utils/color_manager.dart';
import 'package:linkify_app/features/payment/presentation/view/widgets/address_body.dart';

class Address extends StatelessWidget {
  const Address({super.key, required this.cartId});

  final String cartId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.mainColor,
        body: AddressBody(
          cartId: cartId,
        ),
      ),
    );
  }
}
