class CreatePaymentIntentInput {
  final num amount;
  final String currency;
  final String customerId;
  final String setupFutureUsage;

  CreatePaymentIntentInput({
    required this.amount,
    required this.currency,
    required this.customerId,
    this.setupFutureUsage = 'off_session',
  });

  Map<String, dynamic> toJson() {
    return {
      "amount": amount * 100,
      "currency": currency,
      "customer": customerId,
      "setup_future_usage": setupFutureUsage
    };
  }
}
