import 'Items.dart';

/// _id : "681dbaa13e5befb39736678e"
/// user : "6816b7cf2f5bc9eb66f64725"
/// items : [{"subcategory":{"_id":"680cd1d855107332d3460f26","name":"بسكويت انربد من اوريو","description":"9 قطع","price":"130 EGP","image":[{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745670615/LinkifyApp/brands/%D9%83%D8%A7%D8%AF%D8%A8%D9%88%D8%B1%D9%8A/categories/%D8%A8%D8%B3%D9%83%D9%88%D9%8A%D8%AA/subcategories/%D8%A8%D8%B3%D9%83%D9%88%D9%8A%D8%AA_%D8%A7%D9%86%D8%B1%D8%A8%D8%AF_%D9%85%D9%86_%D8%A7%D9%88%D8%B1%D9%8A%D9%88_/x2gdnkbbelvv9ucn8n9k.jpg","public_id":"LinkifyApp/brands/كادبوري/categories/بسكويت/subcategories/بسكويت_انربد_من_اوريو_/x2gdnkbbelvv9ucn8n9k","_id":"680cd1d855107332d3460f27","id":"680cd1d855107332d3460f27"}],"categoryId":{"_id":"680cd18455107332d3460f1a","name":"بسكويت","id":"680cd18455107332d3460f1a"},"brandId":{"_id":"680a630f9a4299c023d2cd7f","name":"كادبوري","image":[{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745511184/LinkifyApp/brand/image/undefined/i7pocecntfgjrvst2qir.jpg","public_id":"LinkifyApp/brand/image/undefined/i7pocecntfgjrvst2qir","_id":"680a630f9a4299c023d2cd80","id":"680a630f9a4299c023d2cd80"}],"id":"680a630f9a4299c023d2cd7f"},"createdAt":"2025-04-26T12:30:16.330Z","__v":0,"id":"680cd1d855107332d3460f26"},"quantity":50,"price":"130 EGP","_id":"6820c9eceebc915fbe0630ad","id":"6820c9eceebc915fbe0630ad"}]
/// updatedAt : "2025-05-11T16:40:09.117Z"
/// createdAt : "2025-05-09T08:19:45.840Z"
/// __v : 4
/// id : "681dbaa13e5befb39736678e"

class DeleteItemFromCartData {
  DeleteItemFromCartData({
    String? id,
    String? user,
    List<Items>? items,
    String? updatedAt,
    String? createdAt,
    num? v,
  }) {
    _id = id;
    _user = user;
    _items = items;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _v = v;
  }

  DeleteItemFromCartData.fromJson(dynamic json) {
    _id = json['_id'];
    _user = json['user'];
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(Items.fromJson(v));
      });
    }
    _updatedAt = json['updatedAt'];
    _createdAt = json['createdAt'];
    _v = json['__v'];
  }

  String? _id;
  String? _user;
  List<Items>? _items;
  String? _updatedAt;
  String? _createdAt;
  num? _v;

  String? get id => _id ?? "";

  String? get user => _user ?? "";

  List<Items>? get items => _items ?? [];

  String? get updatedAt => _updatedAt ?? "";

  String? get createdAt => _createdAt ?? "";

  num? get v => _v ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['user'] = _user;
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    map['updatedAt'] = _updatedAt;
    map['createdAt'] = _createdAt;
    map['__v'] = _v;
    return map;
  }
}
