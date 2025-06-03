import 'package:linkify_app/features/cart/data/models/add_product_to_cart/AddToCartItem.dart';
import 'package:linkify_app/features/cart/data/models/get_products_in_cart/GetProductInCartResponse.dart';

sealed class AddToCartState {}

final class AddToCartInitial extends AddToCartState {}

final class AddToCartLoading extends AddToCartState {
  final String productId;

  AddToCartLoading({required this.productId});
}

final class AddToCartSuccess extends AddToCartState {
  final List<AddToCartItem> addToCartItem;
  final String productId;

  AddToCartSuccess({required this.productId, required this.addToCartItem});
}

final class AddToCartFailure extends AddToCartState {
  final String errorMessage;
  final String productId;

  AddToCartFailure({required this.productId, required this.errorMessage});
}

final class GetCartSuccess extends AddToCartState {
  final GetProductInCartResponse getProductInCartResponse;

  GetCartSuccess({required this.getProductInCartResponse});
}

final class GetCartFailure extends AddToCartState {
  final String errorMessage;

  GetCartFailure({required this.errorMessage});
}

final class UpdateItemCartSuccess extends AddToCartState {
  final GetProductInCartResponse getProductInCartResponse;

  UpdateItemCartSuccess({required this.getProductInCartResponse});
}

final class UpdateItemCartFailure extends AddToCartState {
  final String errorMessage;

  UpdateItemCartFailure({required this.errorMessage});
}
