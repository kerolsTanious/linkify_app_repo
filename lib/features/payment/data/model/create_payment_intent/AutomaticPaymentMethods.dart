/// allow_redirects : "always"
/// enabled : true

class AutomaticPaymentMethods {
  AutomaticPaymentMethods({
      String? allowRedirects, 
      bool? enabled,}){
    _allowRedirects = allowRedirects;
    _enabled = enabled;
}

  AutomaticPaymentMethods.fromJson(dynamic json) {
    _allowRedirects = json['allow_redirects'];
    _enabled = json['enabled'];
  }
  String? _allowRedirects;
  bool? _enabled;

  String? get allowRedirects => _allowRedirects;
  bool? get enabled => _enabled;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['allow_redirects'] = _allowRedirects;
    map['enabled'] = _enabled;
    return map;
  }

}