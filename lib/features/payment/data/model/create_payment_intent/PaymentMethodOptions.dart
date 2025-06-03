import 'AmazonPay.dart';
import 'Card.dart';
import 'Klarna.dart';
import 'Link.dart';

/// amazon_pay : {"express_checkout_element_session_id":null}
/// card : {"installments":null,"mandate_options":null,"network":null,"request_three_d_secure":"automatic"}
/// cashapp : {}
/// klarna : {"preferred_locale":null}
/// link : {"persistent_token":null}

class PaymentMethodOptions {
  PaymentMethodOptions({
      AmazonPay? amazonPay, 
      Card? card, 
      dynamic cashapp, 
      Klarna? klarna, 
      Link? link,}){
    _amazonPay = amazonPay;
    _card = card;
    _cashapp = cashapp;
    _klarna = klarna;
    _link = link;
}

  PaymentMethodOptions.fromJson(dynamic json) {
    _amazonPay = json['amazon_pay'] != null ? AmazonPay.fromJson(json['amazon_pay']) : null;
    _card = json['card'] != null ? Card.fromJson(json['card']) : null;
    _cashapp = json['cashapp'];
    _klarna = json['klarna'] != null ? Klarna.fromJson(json['klarna']) : null;
    _link = json['link'] != null ? Link.fromJson(json['link']) : null;
  }
  AmazonPay? _amazonPay;
  Card? _card;
  dynamic _cashapp;
  Klarna? _klarna;
  Link? _link;

  AmazonPay? get amazonPay => _amazonPay;
  Card? get card => _card;
  dynamic get cashapp => _cashapp;
  Klarna? get klarna => _klarna;
  Link? get link => _link;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_amazonPay != null) {
      map['amazon_pay'] = _amazonPay?.toJson();
    }
    if (_card != null) {
      map['card'] = _card?.toJson();
    }
    map['cashapp'] = _cashapp;
    if (_klarna != null) {
      map['klarna'] = _klarna?.toJson();
    }
    if (_link != null) {
      map['link'] = _link?.toJson();
    }
    return map;
  }

}