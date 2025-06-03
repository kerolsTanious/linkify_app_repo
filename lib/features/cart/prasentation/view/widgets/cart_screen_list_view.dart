import 'package:flutter/material.dart';
import 'package:linkify_app/features/cart/data/models/get_products_in_cart/GetProductsInCartItems.dart';
import 'package:linkify_app/features/cart/prasentation/view/widgets/cart_screen_list_view_item.dart';

class CartScreenListView extends StatelessWidget {
  const CartScreenListView({
    super.key,
    required this.getProductsInCartItems,
  });

  final List<GetProductsInCartItems> getProductsInCartItems;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: getProductsInCartItems.length,
      itemBuilder: (context, index) {
        return CartScreenListViewItem(
          getCartItemData: getProductsInCartItems[index],
        );
      },
    );
  }
}
