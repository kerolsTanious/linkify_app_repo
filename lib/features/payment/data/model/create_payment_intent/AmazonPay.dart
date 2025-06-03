/// express_checkout_element_session_id : null

class AmazonPay {
  AmazonPay({
      dynamic expressCheckoutElementSessionId,}){
    _expressCheckoutElementSessionId = expressCheckoutElementSessionId;
}

  AmazonPay.fromJson(dynamic json) {
    _expressCheckoutElementSessionId = json['express_checkout_element_session_id'];
  }
  dynamic _expressCheckoutElementSessionId;

  dynamic get expressCheckoutElementSessionId => _expressCheckoutElementSessionId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['express_checkout_element_session_id'] = _expressCheckoutElementSessionId;
    return map;
  }

}