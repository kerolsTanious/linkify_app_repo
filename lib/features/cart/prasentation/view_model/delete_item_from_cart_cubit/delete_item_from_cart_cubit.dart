import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkify_app/features/cart/data/repo/cart_repo.dart';
import 'delete_item_from_cart_state.dart';


class DeleteItemFromCartCubit extends Cubit<DeleteItemFromCartState> {
  DeleteItemFromCartCubit({required this.cartRepo})
      : super(DeleteItemFromCartInitial());

  final CartRepo cartRepo;

  Future<void> deleteItemFromCart({
    required String token,
    required String itemId,
  }) async {
    emit(DeleteItemFromCartLoading(productId: itemId));
    var result =
        await cartRepo.deleteItemFromCart(token: token, itemId: itemId);
    result.fold(
      (response) {
        emit(DeleteItemFromCartSuccess(
            deleteItemFromCartResponse: response, productId: itemId));
      },
      (error) {
        emit(DeleteItemFromCartFailure(errorMessage: error, productId: itemId));
      },
    );
  }
}
