import 'CreateOrderItems.dart';
import 'CreateOrderShippingAddress.dart';

/// _id : "6838a613d1742e7a6103ab49"
/// user : "6838721dd1742e7a6103a909"
/// items : [{"subcategory":{"_id":"680bc7e37fff77f23f0f8536","name":"حليب بدون لاكتوز","price":"45 EGP","image":[{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745602531/LinkifyApp/brands/%D8%AC%D9%87%D9%8A%D9%86%D8%A9/categories/%D8%AD%D9%84%D9%8A%D8%A8/subcategories/%D8%AD%D9%84%D9%8A%D8%A8_%D8%A8%D8%AF%D9%88%D9%86_%D9%84%D8%A7%D9%83%D8%AA%D9%88%D8%B2/jfkxd6cduihl2lsqvm9c.png","public_id":"LinkifyApp/brands/جهينة/categories/حليب/subcategories/حليب_بدون_لاكتوز/jfkxd6cduihl2lsqvm9c","_id":"680bc7e37fff77f23f0f8537"}],"categoryId":{"_id":"680b83060988c86d27de6994","name":"حليب"},"brandId":{"_id":"680a62029a4299c023d2cd67","name":"جهينة","image":[{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745510915/LinkifyApp/brand/image/undefined/sdfhcxajstadfnevyxst.png","public_id":"LinkifyApp/brand/image/undefined/sdfhcxajstadfnevyxst","_id":"680a62029a4299c023d2cd68"}]},"createdAt":"2025-04-25T17:35:31.208Z","__v":0,"id":"680bc7e37fff77f23f0f8536"},"quantity":1,"price":"45 EGP","selectedOptions":{}},{"subcategory":{"_id":"680bc87e7fff77f23f0f8544","name":"حليب خالي من اللاكتوز","price":"55 EGP","image":[{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745602686/LinkifyApp/brands/%D8%AC%D9%87%D9%8A%D9%86%D8%A9/categories/%D8%AD%D9%84%D9%8A%D8%A8/subcategories/%D8%AD%D9%84%D9%8A%D8%A8_%D8%AE%D8%A7%D9%84%D9%8A_%D9%85%D9%86_%D8%A7%D9%84%D9%84%D8%A7%D9%83%D8%AA%D9%88%D8%B2/djx26quypxleqlucabjh.png","public_id":"LinkifyApp/brands/جهينة/categories/حليب/subcategories/حليب_خالي_من_اللاكتوز/djx26quypxleqlucabjh","_id":"680bc87e7fff77f23f0f8545"}],"categoryId":{"_id":"680b83060988c86d27de6994","name":"حليب"},"brandId":{"_id":"680a62029a4299c023d2cd67","name":"جهينة","image":[{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745510915/LinkifyApp/brand/image/undefined/sdfhcxajstadfnevyxst.png","public_id":"LinkifyApp/brand/image/undefined/sdfhcxajstadfnevyxst","_id":"680a62029a4299c023d2cd68"}]},"createdAt":"2025-04-25T17:38:06.591Z","__v":0,"id":"680bc87e7fff77f23f0f8544"},"quantity":1,"price":"55 EGP","selectedOptions":{}}]
/// shippingAddress : {"_id":"683884b9d1742e7a6103aab3","user":"6838721dd1742e7a6103a909","recipientName":"كيرلس طنيوس","street":"حارة الدكتور مصطفي كامل","country":"Egypt","phone":"01277512154","location":"الزيتون","isDefault":false,"notes":"","createdAt":"2025-05-29T16:00:57.681Z","updatedAt":"2025-05-29T16:00:57.681Z","__v":0,"id":"683884b9d1742e7a6103aab3"}
/// paymentMethod : "credit_card"
/// deliveryDate : "2025-06-01T18:23:15.222Z"
/// createdAt : "2025-05-29T18:23:15.225Z"
/// updatedAt : "2025-05-29T18:23:15.225Z"
/// __v : 0
/// id : "6838a613d1742e7a6103ab49"

class CreateOrderData {
  CreateOrderData({
    String? id,
    String? user,
    List<CreateOrderItems>? items,
    CreateOrderShippingAddress? shippingAddress,
    String? paymentMethod,
    String? deliveryDate,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) {
    _id = id;
    _user = user;
    _items = items;
    _shippingAddress = shippingAddress;
    _paymentMethod = paymentMethod;
    _deliveryDate = deliveryDate;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
  }

  CreateOrderData.fromJson(dynamic json) {
    _id = json['_id'];
    _user = json['user'];
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(CreateOrderItems.fromJson(v));
      });
    }
    _shippingAddress = json['shippingAddress'] != null
        ? CreateOrderShippingAddress.fromJson(json['shippingAddress'])
        : null;
    _paymentMethod = json['paymentMethod'];
    _deliveryDate = json['deliveryDate'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }

  String? _id;
  String? _user;
  List<CreateOrderItems>? _items;
  CreateOrderShippingAddress? _shippingAddress;
  String? _paymentMethod;
  String? _deliveryDate;
  String? _createdAt;
  String? _updatedAt;
  num? _v;

  String? get id => _id ?? "";

  String? get user => _user ?? "";

  List<CreateOrderItems>? get items => _items ?? [];

  CreateOrderShippingAddress? get shippingAddress => _shippingAddress ?? CreateOrderShippingAddress();

  String? get paymentMethod => _paymentMethod ?? "";

  String? get deliveryDate => _deliveryDate ?? "";

  String? get createdAt => _createdAt ?? "";

  String? get updatedAt => _updatedAt ?? "";

  num? get v => _v ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['user'] = _user;
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    if (_shippingAddress != null) {
      map['shippingAddress'] = _shippingAddress?.toJson();
    }
    map['paymentMethod'] = _paymentMethod;
    map['deliveryDate'] = _deliveryDate;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }
}
