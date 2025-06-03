import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkify_app/features/cart/data/repo/cart_repo.dart';
import 'package:linkify_app/features/cart/prasentation/view_model/clear_cart/clear_cart_state.dart';

class ClearCartCubit extends Cubit<ClearCartState> {
  ClearCartCubit({required this.cartRepo}) : super(ClearCartInitial());

  final CartRepo cartRepo;

  Future<void> clearCart({required String token}) async {
    var result = await cartRepo.clearCart(token: token);
    result.fold(
      (response) {
        emit(ClearCartSuccess(clearCartResponse: response));
      },
      (error) {
        emit(ClearCartFailure(errorMessage: error));
      },
    );
  }
}
