import 'Error.dart';

/// error : {"code":"parameter_missing","doc_url":"https://stripe.com/docs/error-codes/parameter-missing","message":"Missing required param: amount.","param":"amount","request_log_url":"https://dashboard.stripe.com/test/logs/req_fG1j59aFA4cqKZ?t=1748645844","type":"invalid_request_error"}

class CreatePaymentIntentModelErrorResponse {
  CreatePaymentIntentModelErrorResponse({
    CreatePaymentIntentErrorData? error,
  }) {
    _error = error;
  }

  CreatePaymentIntentModelErrorResponse.fromJson(dynamic json) {
    _error = json['error'] != null ? CreatePaymentIntentErrorData.fromJson(json['error']) : null;
  }

  CreatePaymentIntentErrorData? _error;

  CreatePaymentIntentErrorData? get error => _error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_error != null) {
      map['error'] = _error?.toJson();
    }
    return map;
  }
}
