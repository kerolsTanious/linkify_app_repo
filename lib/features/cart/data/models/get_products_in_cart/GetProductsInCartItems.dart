import 'GetProductsInCartSubcategory.dart';

/// subcategory : {"_id":"680ccd0255107332d3460ee9","name":"سبريت","description":"1 لتر","price":"30 EGP","image":[{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745669377/LinkifyApp/brands/%D8%A8%D9%8A%D8%A8%D8%B3%D9%8A/categories/%D8%A8%D9%8A%D8%A8%D8%B3%D9%8A/subcategories/%D8%B3%D8%A8%D8%B1%D9%8A%D8%AA/jvztuqgnxa5qc8l9d1tp.jpg","public_id":"LinkifyApp/brands/بيبسي/categories/بيبسي/subcategories/سبريت/jvztuqgnxa5qc8l9d1tp","_id":"680ccd0255107332d3460eea","id":"680ccd0255107332d3460eea"}],"categoryId":{"_id":"680cc8f355107332d3460e86","name":"بيبسي","id":"680cc8f355107332d3460e86"},"brandId":{"_id":"680a62e39a4299c023d2cd79","name":"بيبسي","image":[{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745511139/LinkifyApp/brand/image/undefined/nhzkx1eblh5cc3yhlpdo.png","public_id":"LinkifyApp/brand/image/undefined/nhzkx1eblh5cc3yhlpdo","_id":"680a62e39a4299c023d2cd7a","id":"680a62e39a4299c023d2cd7a"}],"id":"680a62e39a4299c023d2cd79"},"createdAt":"2025-04-26T12:09:38.069Z","__v":0,"id":"680ccd0255107332d3460ee9"}
/// quantity : 50
/// price : "30 EGP"
/// selectedOptions : {}
/// _id : "6820fae0eebc915fbe063a71"
/// id : "6820fae0eebc915fbe063a71"

class GetProductsInCartItems {
  GetProductsInCartItems({
    GetProductsInCartSubcategory? subcategory,
    num? quantity,
    String? price,
    dynamic selectedOptions,
    String? id,
  }) {
    _subcategory = subcategory;
    _quantity = quantity;
    _price = price;
    _selectedOptions = selectedOptions;
    _id = id;
  }

  GetProductsInCartItems.fromJson(dynamic json) {
    _subcategory = json['subcategory'] != null
        ? GetProductsInCartSubcategory.fromJson(json['subcategory'])
        : null;
    _quantity = json['quantity'];
    _price = json['price'];
    _selectedOptions = json['selectedOptions'];
    _id = json['_id'];
  }

  GetProductsInCartSubcategory? _subcategory;
  num? _quantity;
  String? _price;
  dynamic _selectedOptions;
  String? _id;

  GetProductsInCartSubcategory? get subcategory => _subcategory ?? GetProductsInCartSubcategory();

  num? get quantity => _quantity ?? 0;

  String? get price => _price ?? "";

  dynamic get selectedOptions => _selectedOptions ?? dynamic;

  String? get id => _id ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_subcategory != null) {
      map['subcategory'] = _subcategory?.toJson();
    }
    map['quantity'] = _quantity;
    map['price'] = _price;
    map['selectedOptions'] = _selectedOptions;
    map['_id'] = _id;
    return map;
  }
}
