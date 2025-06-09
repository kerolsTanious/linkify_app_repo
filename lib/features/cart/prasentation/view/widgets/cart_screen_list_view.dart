import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkify_app/core/utils/color_manager.dart';
import 'package:linkify_app/core/utils/styles_manager.dart';
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
    return Column(
      children: [
        SizedBox(height: 15.h),
        Text(
          "📌 هذا السعر شامل الضريبة ولا توجد أي مصاريف إضافية",
          style: Styles.textStyle16.copyWith(
            color: ColorManager.texColor,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10.h),
        Expanded(
          child: ListView.builder(
            itemCount: getProductsInCartItems.length,
            itemBuilder: (context, index) {
              return CartScreenListViewItem(
                getCartItemData: getProductsInCartItems[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
