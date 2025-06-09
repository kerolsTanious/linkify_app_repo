import 'AdminAddProductModelImage.dart';

/// name : "لبن خالي الدسم"
/// description : "حليب خالي الدسم من جهينة، 1.5 لتر"
/// price : "70"
/// image : [{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1749224288/LinkifyApp/brands/%D8%AC%D9%87%D9%8A%D9%86%D8%A9/categories/%D8%AD%D9%84%D9%8A%D8%A8/%D9%84%D8%A8%D9%86%20%D8%AE%D8%A7%D9%84%D9%8A%20%D8%A7%D9%84%D8%AF%D8%B3%D9%85/athjsomvz8onu1fx5evi.jpg","public_id":"LinkifyApp/brands/جهينة/categories/حليب/لبن خالي الدسم/athjsomvz8onu1fx5evi","_id":"68430b61103867276bd54c26"}]
/// categoryId : "680b83060988c86d27de6994"
/// brandId : "680a62029a4299c023d2cd67"
/// quantity : "1"
/// _id : "68430b61103867276bd54c25"
/// createdAt : "2025-06-06T15:38:09.496Z"
/// __v : 0

class Data {
  Data({
    String? name,
    String? description,
    String? price,
    List<Image>? image,
    String? categoryId,
    String? brandId,
    String? quantity,
    String? id,
    String? createdAt,
    num? v,
  }) {
    _name = name;
    _description = description;
    _price = price;
    _image = image;
    _categoryId = categoryId;
    _brandId = brandId;
    _quantity = quantity;
    _id = id;
    _createdAt = createdAt;
    _v = v;
  }

  Data.fromJson(dynamic json) {
    _name = json['name'];
    _description = json['description'];
    _price = json['price'];
    if (json['image'] != null) {
      _image = [];
      json['image'].forEach((v) {
        _image?.add(Image.fromJson(v));
      });
    }
    _categoryId = json['categoryId'];
    _brandId = json['brandId'];
    _quantity = json['quantity'];
    _id = json['_id'];
    _createdAt = json['createdAt'];
    _v = json['__v'];
  }

  String? _name;
  String? _description;
  String? _price;
  List<Image>? _image;
  String? _categoryId;
  String? _brandId;
  String? _quantity;
  String? _id;
  String? _createdAt;
  num? _v;

  String? get name => _name ?? "";

  String? get description => _description ?? "";

  String? get price => _price ?? "";

  List<Image>? get image => _image ?? [];

  String? get categoryId => _categoryId ?? "";

  String? get brandId => _brandId ?? "";

  String? get quantity => _quantity ?? "";

  String? get id => _id ?? "";

  String? get createdAt => _createdAt ?? "";

  num? get v => _v ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['description'] = _description;
    map['price'] = _price;
    if (_image != null) {
      map['image'] = _image?.map((v) => v.toJson()).toList();
    }
    map['categoryId'] = _categoryId;
    map['brandId'] = _brandId;
    map['quantity'] = _quantity;
    map['_id'] = _id;
    map['createdAt'] = _createdAt;
    map['__v'] = _v;
    return map;
  }
}
