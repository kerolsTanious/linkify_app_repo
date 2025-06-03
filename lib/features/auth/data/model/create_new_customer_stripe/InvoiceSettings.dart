/// custom_fields : null
/// default_payment_method : null
/// footer : null
/// rendering_options : null

class InvoiceSettings {
  InvoiceSettings({
      dynamic customFields, 
      dynamic defaultPaymentMethod, 
      dynamic footer, 
      dynamic renderingOptions,}){
    _customFields = customFields;
    _defaultPaymentMethod = defaultPaymentMethod;
    _footer = footer;
    _renderingOptions = renderingOptions;
}

  InvoiceSettings.fromJson(dynamic json) {
    _customFields = json['custom_fields'];
    _defaultPaymentMethod = json['default_payment_method'];
    _footer = json['footer'];
    _renderingOptions = json['rendering_options'];
  }
  dynamic _customFields;
  dynamic _defaultPaymentMethod;
  dynamic _footer;
  dynamic _renderingOptions;

  dynamic get customFields => _customFields;
  dynamic get defaultPaymentMethod => _defaultPaymentMethod;
  dynamic get footer => _footer;
  dynamic get renderingOptions => _renderingOptions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['custom_fields'] = _customFields;
    map['default_payment_method'] = _defaultPaymentMethod;
    map['footer'] = _footer;
    map['rendering_options'] = _renderingOptions;
    return map;
  }

}