import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkify_app/features/payment/data/repo/payment_repo.dart';

import 'create_order_state.dart';

class CreateOrderCubit extends Cubit<CreateOrderState> {
  CreateOrderCubit({required this.paymentRepo}) : super(CreateOrderInitial());

  final PaymentRepo paymentRepo;

  Future<void> createOrder({
    required String token,
    required String cartId,
    required String paymentMethod,
    required String addressId
  }) async {
    var result = await paymentRepo.createOrder(
      token: token,
      cartId: cartId,
      paymentMethod: paymentMethod,
      addressId: addressId,
    );
    result.fold(
      (response) {
        emit(CreateOrderSuccess(createOrderResponse: response));
      },
      (error) {
        emit(CreateOrderFailure(errorMessage: error));
      },
    );
  }
}
