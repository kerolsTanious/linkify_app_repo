import '../../../data/models/delete_product_from_cart/DeleteItemFromCartResponse.dart';

sealed class DeleteItemFromCartState {}

final class DeleteItemFromCartInitial extends DeleteItemFromCartState {}

final class DeleteItemFromCartLoading extends DeleteItemFromCartState {
  final String productId;

  DeleteItemFromCartLoading({required this.productId});
}

final class DeleteItemFromCartFailure extends DeleteItemFromCartState {
  final String errorMessage;
  final String productId;

  DeleteItemFromCartFailure({
    required this.productId,
    required this.errorMessage,
  });
}

final class DeleteItemFromCartSuccess extends DeleteItemFromCartState {
  final DeleteItemFromCartResponse deleteItemFromCartResponse;
  final String productId;

  DeleteItemFromCartSuccess({
    required this.productId,
    required this.deleteItemFromCartResponse,
  });
}
