import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:linkify_app/core/api/api_manager.dart';
import 'package:linkify_app/core/api/end_points.dart';
import 'package:linkify_app/core/constants.dart';
import 'package:linkify_app/core/prefs.dart';
import 'package:linkify_app/features/payment/data/model/create_ephemeral_key/CreateEphemeraKeyResponse.dart';
import 'package:linkify_app/features/payment/data/model/create_payment_intent/CreatePaymentIntentModelResponse.dart';
import 'package:linkify_app/features/payment/data/model/create_payment_intent_input.dart';

import '../api/api_keys.dart';

class StripeManager {
  final ApiManager apiManager;

  StripeManager({required this.apiManager});

  Future<CreatePaymentIntentModelResponse> createPaymentIntent(
      {required CreatePaymentIntentInput input}) async {
    var response = await apiManager.postRequest(
      baseUrl: Constants.stripeBaseUrl,
      endPoints: EndPoints.createPaymentIntent,
      body: input.toJson(),
      contentType: 'application/x-www-form-urlencoded',
      headers: {
        'Authorization': 'Bearer ${ApiKeys.secretStripeKey}',
      },
    );
    CreatePaymentIntentModelResponse createPaymentIntentModelResponse =
        CreatePaymentIntentModelResponse.fromJson(response.data);
    return createPaymentIntentModelResponse;
  }

  Future<CreateEphemeraKeyResponse> createEphemeralKey(
      {required String customerId}) async {
    var response = await apiManager.postRequest(
      baseUrl: Constants.stripeBaseUrl,
      endPoints: EndPoints.ephemeralKeys,
      body: {
        "customer": customerId,
      },
      headers: {
        'Authorization': 'Bearer ${ApiKeys.secretStripeKey}',
        "Stripe-Version": "2025-02-24.acacia",
      },
      contentType: 'application/x-www-form-urlencoded',
    );
    CreateEphemeraKeyResponse createEphemeraKeyResponse =
        CreateEphemeraKeyResponse.fromJson(response.data);
    return createEphemeraKeyResponse;
  }

  Future<void> initPaymentSheet({
    required String paymentIntentClientSecret,
    required String customerEphemeralKeySecret,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        merchantDisplayName: 'Linkify',
        paymentIntentClientSecret: paymentIntentClientSecret,
        customerEphemeralKeySecret: customerEphemeralKeySecret,
        customerId: PrefsHelper.getString(key: PrefsKey.customerId),
      ),
    );
  }

  Future<void> displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<CreatePaymentIntentModelResponse> makePayment({
    required CreatePaymentIntentInput input,
  }) async {
    var response = await createPaymentIntent(input: input);

    var result = await createEphemeralKey(
        customerId: PrefsHelper.getString(key: PrefsKey.customerId));

    await initPaymentSheet(
      paymentIntentClientSecret: response.clientSecret ?? "",
      customerEphemeralKeySecret: result.secret ?? "",
    );

    await displayPaymentSheet();

    return response;
  }
}
