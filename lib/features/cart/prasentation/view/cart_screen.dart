import 'package:flutter/material.dart';
import 'package:linkify_app/features/cart/prasentation/view/widgets/cart_screen_body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CartScreenBody(),
      ),
    );
  }
}
