import 'Subcategory.dart';

/// subcategory : {"_id":"680cd1d855107332d3460f26","name":"بسكويت انربد من اوريو","description":"9 قطع","price":"130 EGP","image":[{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745670615/LinkifyApp/brands/%D9%83%D8%A7%D8%AF%D8%A8%D9%88%D8%B1%D9%8A/categories/%D8%A8%D8%B3%D9%83%D9%88%D9%8A%D8%AA/subcategories/%D8%A8%D8%B3%D9%83%D9%88%D9%8A%D8%AA_%D8%A7%D9%86%D8%B1%D8%A8%D8%AF_%D9%85%D9%86_%D8%A7%D9%88%D8%B1%D9%8A%D9%88_/x2gdnkbbelvv9ucn8n9k.jpg","public_id":"LinkifyApp/brands/كادبوري/categories/بسكويت/subcategories/بسكويت_انربد_من_اوريو_/x2gdnkbbelvv9ucn8n9k","_id":"680cd1d855107332d3460f27","id":"680cd1d855107332d3460f27"}],"categoryId":{"_id":"680cd18455107332d3460f1a","name":"بسكويت","id":"680cd18455107332d3460f1a"},"brandId":{"_id":"680a630f9a4299c023d2cd7f","name":"كادبوري","image":[{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745511184/LinkifyApp/brand/image/undefined/i7pocecntfgjrvst2qir.jpg","public_id":"LinkifyApp/brand/image/undefined/i7pocecntfgjrvst2qir","_id":"680a630f9a4299c023d2cd80","id":"680a630f9a4299c023d2cd80"}],"id":"680a630f9a4299c023d2cd7f"},"createdAt":"2025-04-26T12:30:16.330Z","__v":0,"id":"680cd1d855107332d3460f26"}
/// quantity : 50
/// price : "130 EGP"
/// _id : "6820c9eceebc915fbe0630ad"
/// id : "6820c9eceebc915fbe0630ad"

class Items {
  Items({
    Subcategory? subcategory,
    num? quantity,
    String? price,
    String? id,
  }) {
    _subcategory = subcategory;
    _quantity = quantity;
    _price = price;
    _id = id;
    _id = id;
  }

  Items.fromJson(dynamic json) {
    _subcategory = json['subcategory'] != null
        ? Subcategory.fromJson(json['subcategory'])
        : null;
    _quantity = json['quantity'];
    _price = json['price'];
    _id = json['_id'];
    _id = json['id'];
  }

  Subcategory? _subcategory;
  num? _quantity;
  String? _price;
  String? _id;

  Subcategory? get subcategory => _subcategory;

  num? get quantity => _quantity;

  String? get price => _price;

  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_subcategory != null) {
      map['subcategory'] = _subcategory?.toJson();
    }
    map['quantity'] = _quantity;
    map['price'] = _price;
    map['_id'] = _id;
    return map;
  }
}
