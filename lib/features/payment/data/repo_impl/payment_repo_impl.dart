import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:linkify_app/core/api/api_manager.dart';
import 'package:linkify_app/core/api/end_points.dart';
import 'package:linkify_app/core/constants.dart';
import 'package:linkify_app/core/stripe/stripe_manager.dart';
import 'package:linkify_app/features/payment/data/model/create_order/CreateOrderResponse.dart';
import 'package:linkify_app/features/payment/data/model/create_payment_intent/CreatePaymentIntentModelResponse.dart';
import 'package:linkify_app/features/payment/data/model/create_payment_intent_input.dart';
import 'package:linkify_app/features/payment/data/model/create_payment_intent_model_error/CreatePaymentIntentModelErrorResponse.dart';
import 'package:linkify_app/features/payment/data/model/get_order_details/GetOrderDetails.dart';
import 'package:linkify_app/features/payment/data/model/save_address/SaveAddressResponse.dart';
import 'package:linkify_app/features/payment/data/repo/payment_repo.dart';

import '../model/create_payment_intent_model_error/Error.dart';

class PaymentRepoImpl extends PaymentRepo {
  final ApiManager apiManager;
  final StripeManager stripeManager;

  PaymentRepoImpl({required this.stripeManager, required this.apiManager});

  @override
  Future<Either<SaveAddressResponse, String>> saveAddress({
    required String token,
    required String name,
    required String phone,
    required String street,
    required String location,
    String? notes,
  }) async {
    try {
      var response = await apiManager.postRequest(
          baseUrl: Constants.baseUrl,
          endPoints: EndPoints.saveAddress,
          body: {
            "recipientName": name,
            "location": location,
            "street": street,
            "notes": notes,
            "phone": phone,
          },
          headers: {
            "Authorization": "Bearer $token",
          });
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        SaveAddressResponse saveAddressResponse =
            SaveAddressResponse.fromJson(response.data);
        return Left(saveAddressResponse);
      } else {
        return Right("Something went wrong. Please try again later.");
      }
    } catch (error) {
      return Right(error.toString());
    }
  }

  @override
  Future<Either<CreateOrderResponse, String>> createOrder({
    required String token,
    required String cartId,
    required String paymentMethod,
  }) async {
    try {
      var response = await apiManager.postRequest(
          baseUrl: Constants.baseUrl,
          endPoints: EndPoints.createOrder,
          body: {
            "cartId": cartId,
            "paymentMethod": paymentMethod,
          },
          headers: {
            "Authorization": "Bearer $token",
          });
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        CreateOrderResponse createOrderResponse =
            CreateOrderResponse.fromJson(response.data);
        return Left(createOrderResponse);
      } else {
        return Right("Something went wrong. Please try again later.");
      }
    } catch (error) {
      return Right(error.toString());
    }
  }

  @override
  Future<
      Either<CreatePaymentIntentModelResponse,
          CreatePaymentIntentModelErrorResponse>> makePayment(
      {required CreatePaymentIntentInput input}) async {
    try {
      var response = await stripeManager.makePayment(input: input);
      return Left(response);
    } catch (e) {
      if (e is DioError) {
        final errorData = e.response?.data;
        if (errorData != null && errorData is Map<String, dynamic>) {
          // This is the JSON you want to parse with your error model
          final errorModel =
              CreatePaymentIntentModelErrorResponse.fromJson(errorData);
          return Right(errorModel);
        } else {
          // Fallback error with minimal info
          return Right(CreatePaymentIntentModelErrorResponse(
            error: CreatePaymentIntentErrorData(message: 'Unknown error'),
          ));
        }
      } else {
        // Non-Dio errors
        return Right(CreatePaymentIntentModelErrorResponse(
          error: CreatePaymentIntentErrorData(message: e.toString()),
        ));
      }
    }
  }

  @override
  Future<Either<GetOrderDetailsResponse, String>> getOrderDetails(
      {required String token, required String orderId}) async {
    try {
      var response = await apiManager.getRequest(
        baseUrl: Constants.baseUrl,
        endPoint: EndPoints.getOrderDetails(orderId: orderId),
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        GetOrderDetailsResponse getOrderDetailsResponse =
            GetOrderDetailsResponse.fromJson(response.data);
        return Left(getOrderDetailsResponse);
      } else {
        return Right("Something went wrong. Please try again later.");
      }
    } catch (e) {
      return Right(e.toString());
    }
  }
}
