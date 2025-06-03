import 'package:linkify_app/features/payment/data/model/create_order/CreateOrderResponse.dart';

sealed class CreateOrderState {}

final class CreateOrderInitial extends CreateOrderState {}

final class CreateOrderSuccess extends CreateOrderState {
  final CreateOrderResponse createOrderResponse;

  CreateOrderSuccess({required this.createOrderResponse});
}

final class CreateOrderFailure extends CreateOrderState {
  final String errorMessage;

  CreateOrderFailure({required this.errorMessage});
}
