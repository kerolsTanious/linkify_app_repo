import 'CreateOrderSubcategory.dart';

/// subcategory : {"_id":"680bc7e37fff77f23f0f8536","name":"حليب بدون لاكتوز","price":"45 EGP","image":[{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745602531/LinkifyApp/brands/%D8%AC%D9%87%D9%8A%D9%86%D8%A9/categories/%D8%AD%D9%84%D9%8A%D8%A8/subcategories/%D8%AD%D9%84%D9%8A%D8%A8_%D8%A8%D8%AF%D9%88%D9%86_%D9%84%D8%A7%D9%83%D8%AA%D9%88%D8%B2/jfkxd6cduihl2lsqvm9c.png","public_id":"LinkifyApp/brands/جهينة/categories/حليب/subcategories/حليب_بدون_لاكتوز/jfkxd6cduihl2lsqvm9c","_id":"680bc7e37fff77f23f0f8537"}],"categoryId":{"_id":"680b83060988c86d27de6994","name":"حليب"},"brandId":{"_id":"680a62029a4299c023d2cd67","name":"جهينة","image":[{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745510915/LinkifyApp/brand/image/undefined/sdfhcxajstadfnevyxst.png","public_id":"LinkifyApp/brand/image/undefined/sdfhcxajstadfnevyxst","_id":"680a62029a4299c023d2cd68"}]},"createdAt":"2025-04-25T17:35:31.208Z","__v":0,"id":"680bc7e37fff77f23f0f8536"}
/// quantity : 1
/// price : "45 EGP"
/// selectedOptions : {}

class CreateOrderItems {
  CreateOrderItems({
    CreateOrderSubcategory? subcategory,
    num? quantity,
    String? price,
    dynamic selectedOptions,
  }) {
    _subcategory = subcategory;
    _quantity = quantity;
    _price = price;
    _selectedOptions = selectedOptions;
  }

  CreateOrderItems.fromJson(dynamic json) {
    _subcategory = json['subcategory'] != null
        ? CreateOrderSubcategory.fromJson(json['subcategory'])
        : null;
    _quantity = json['quantity'];
    _price = json['price'];
    _selectedOptions = json['selectedOptions'];
  }

  CreateOrderSubcategory? _subcategory;
  num? _quantity;
  String? _price;
  dynamic _selectedOptions;

  CreateOrderSubcategory? get subcategory =>
      _subcategory ?? CreateOrderSubcategory();

  num? get quantity => _quantity ?? 0;

  String? get price => _price ?? "";

  dynamic get selectedOptions => _selectedOptions ?? dynamic;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_subcategory != null) {
      map['subcategory'] = _subcategory?.toJson();
    }
    map['quantity'] = _quantity;
    map['price'] = _price;
    map['selectedOptions'] = _selectedOptions;
    return map;
  }
}
