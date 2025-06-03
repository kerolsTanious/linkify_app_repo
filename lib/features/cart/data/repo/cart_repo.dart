import 'package:dartz/dartz.dart';
import 'package:linkify_app/features/cart/data/models/add_product_to_cart/AddToCartResponse.dart';
import 'package:linkify_app/features/cart/data/models/clear_cart/ClearCartResponse.dart';
import 'package:linkify_app/features/cart/data/models/delete_product_from_cart/DeleteItemFromCartResponse.dart';
import 'package:linkify_app/features/cart/data/models/get_products_in_cart/GetProductInCartResponse.dart';

abstract class CartRepo {
  Future<Either<AddToCartResponse, String>> addToCart({
    required String subcategoryId,
    required String token,
  });

  Future<Either<GetProductInCartResponse, String>> getCart(
      {required String token});

  Future<Either<DeleteItemFromCartResponse, String>> deleteItemFromCart({
    required String token,
    required String itemId,
  });

  Future<Either<GetProductInCartResponse, String>> updateCartItem({
    required String token,
    required String itemId,
    required String quantity,
  });

  Future<Either<ClearCartResponse, String>> clearCart({required String token});
}
