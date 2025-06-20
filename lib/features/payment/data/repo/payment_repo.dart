import 'package:dartz/dartz.dart';
import 'package:linkify_app/features/payment/data/model/create_order/CreateOrderResponse.dart';
import 'package:linkify_app/features/payment/data/model/create_payment_intent/CreatePaymentIntentModelResponse.dart';
import 'package:linkify_app/features/payment/data/model/create_payment_intent_input.dart';
import 'package:linkify_app/features/payment/data/model/create_payment_intent_model_error/CreatePaymentIntentModelErrorResponse.dart';
import 'package:linkify_app/features/payment/data/model/get_order_details/GetOrderDetails.dart';
import 'package:linkify_app/features/payment/data/model/save_address/SaveAddressResponse.dart';

abstract class PaymentRepo {
  Future<Either<SaveAddressResponse, String>> saveAddress({
    required String token,
    required String name,
    required String phone,
    required String street,
    required String location,
    String notes,
  });

  Future<Either<CreateOrderResponse, String>> createOrder({
    required String token,
    required String cartId,
    required String paymentMethod,
    required String addressId,
  });

  Future<
      Either<CreatePaymentIntentModelResponse,
          CreatePaymentIntentModelErrorResponse>> makePayment(
      {required CreatePaymentIntentInput input});

  Future<Either<GetOrderDetailsResponse, String>> getOrderDetails({
    required String token,
    required String orderId,
  });
}
