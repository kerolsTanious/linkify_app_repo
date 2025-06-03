/// preferred_locale : null

class Klarna {
  Klarna({
      dynamic preferredLocale,}){
    _preferredLocale = preferredLocale;
}

  Klarna.fromJson(dynamic json) {
    _preferredLocale = json['preferred_locale'];
  }
  dynamic _preferredLocale;

  dynamic get preferredLocale => _preferredLocale;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['preferred_locale'] = _preferredLocale;
    return map;
  }

}