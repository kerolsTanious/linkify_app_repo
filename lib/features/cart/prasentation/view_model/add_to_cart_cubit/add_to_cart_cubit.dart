import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkify_app/features/cart/data/repo/cart_repo.dart';
import 'package:linkify_app/features/cart/prasentation/view_model/add_to_cart_cubit/add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit({required this.cartRepo}) : super(AddToCartInitial());

  final CartRepo cartRepo;

  Future<void> addToCart({
    required String token,
    required String subcategoryId,
  }) async {
    emit(AddToCartLoading(productId: subcategoryId));
    var result = await cartRepo.addToCart(
      subcategoryId: subcategoryId,
      token: token,
    );
    result.fold(
      (response) {
        emit(
          AddToCartSuccess(
            addToCartItem: response.data?.items ?? [],
            productId: subcategoryId,
          ),
        );
      },
      (error) {
        emit(AddToCartFailure(errorMessage: error, productId: subcategoryId));
      },
    );
  }

  Future<void> getCart({required String token}) async {
    var result = await cartRepo.getCart(token: token);
    result.fold(
      (response) {
        emit(GetCartSuccess(getProductInCartResponse: response));
      },
      (error) {
        emit(GetCartFailure(errorMessage: error));
      },
    );
  }

  Future<void> updateCart({
    required String token,
    required String itemId,
    required String quantity,
  }) async {
    var result = await cartRepo.updateCartItem(
      token: token,
      itemId: itemId,
      quantity: quantity,
    );
    result.fold(
      (response) {
        emit(UpdateItemCartSuccess(getProductInCartResponse: response));
      },
      (error) {
        emit(UpdateItemCartFailure(errorMessage: error));
      },
    );
  }
}
