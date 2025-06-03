/// code : "parameter_missing"
/// doc_url : "https://stripe.com/docs/error-codes/parameter-missing"
/// message : "Missing required param: amount."
/// param : "amount"
/// request_log_url : "https://dashboard.stripe.com/test/logs/req_fG1j59aFA4cqKZ?t=1748645844"
/// type : "invalid_request_error"

class CreatePaymentIntentErrorData {
  CreatePaymentIntentErrorData({
    String? code,
    String? docUrl,
    String? message,
    String? param,
    String? requestLogUrl,
    String? type,
  }) {
    _code = code;
    _docUrl = docUrl;
    _message = message;
    _param = param;
    _requestLogUrl = requestLogUrl;
    _type = type;
  }

  CreatePaymentIntentErrorData.fromJson(dynamic json) {
    _code = json['code'];
    _docUrl = json['doc_url'];
    _message = json['message'];
    _param = json['param'];
    _requestLogUrl = json['request_log_url'];
    _type = json['type'];
  }

  String? _code;
  String? _docUrl;
  String? _message;
  String? _param;
  String? _requestLogUrl;
  String? _type;

  String? get code => _code;

  String? get docUrl => _docUrl;

  String? get message => _message;

  String? get param => _param;

  String? get requestLogUrl => _requestLogUrl;

  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['doc_url'] = _docUrl;
    map['message'] = _message;
    map['param'] = _param;
    map['request_log_url'] = _requestLogUrl;
    map['type'] = _type;
    return map;
  }
}
