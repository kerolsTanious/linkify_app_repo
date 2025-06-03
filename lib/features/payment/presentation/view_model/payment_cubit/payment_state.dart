import 'package:linkify_app/features/payment/data/model/create_payment_intent/CreatePaymentIntentModelResponse.dart';
import 'package:linkify_app/features/payment/data/model/create_payment_intent_model_error/CreatePaymentIntentModelErrorResponse.dart';

sealed class PaymentState {}

final class PaymentInitial extends PaymentState {}

final class PaymentSuccess extends PaymentState {
  final CreatePaymentIntentModelResponse createPaymentIntentModelResponse;

  PaymentSuccess({required this.createPaymentIntentModelResponse});
}

final class PaymentFailure extends PaymentState {
  final CreatePaymentIntentModelErrorResponse error;

  PaymentFailure({required this.error});
}
