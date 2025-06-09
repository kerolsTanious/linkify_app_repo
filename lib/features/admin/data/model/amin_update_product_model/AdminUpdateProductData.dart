import 'AdminUpdateProductImage.dart';

/// _id : "684523668e128c079929ab65"
/// name : "لبن خالي"
/// description : "حليب خالي الدسم من جهينة، 1.5 لتر"
/// price : "70"
/// image : [{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1749361510/LinkifyApp/brands/%D8%AC%D9%87%D9%8A%D9%86%D8%A9/categories/%D8%AD%D9%84%D9%8A%D8%A8/%D9%84%D8%A8%D9%86%20%D8%AE%D8%A7%D9%84%D9%8A%20%D8%A7%D9%84%D8%AF%D8%B3%D9%85/vzcscjd6vtyyqlsyl3al.jpg","public_id":"LinkifyApp/brands/جهينة/categories/حليب/لبن خالي الدسم/vzcscjd6vtyyqlsyl3al","_id":"684523668e128c079929ab66"}]
/// categoryId : "680b83060988c86d27de6994"
/// brandId : "680a62029a4299c023d2cd67"
/// quantity : "1"
/// createdAt : "2025-06-08T05:45:10.750Z"
/// __v : 0

class AdminUpdateProductData {
  AdminUpdateProductData({
    String? id,
    String? name,
    String? description,
    String? price,
    List<AdminUpdateProductImage>? image,
    String? categoryId,
    String? brandId,
    String? quantity,
    String? createdAt,
    num? v,
  }) {
    _id = id;
    _name = name;
    _description = description;
    _price = price;
    _image = image;
    _categoryId = categoryId;
    _brandId = brandId;
    _quantity = quantity;
    _createdAt = createdAt;
    _v = v;
  }

  AdminUpdateProductData.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _description = json['description'];
    _price = json['price'];
    if (json['image'] != null) {
      _image = [];
      json['image'].forEach((v) {
        _image?.add(AdminUpdateProductImage.fromJson(v));
      });
    }
    _categoryId = json['categoryId'];
    _brandId = json['brandId'];
    _quantity = json['quantity'];
    _createdAt = json['createdAt'];
    _v = json['__v'];
  }

  String? _id;
  String? _name;
  String? _description;
  String? _price;
  List<AdminUpdateProductImage>? _image;
  String? _categoryId;
  String? _brandId;
  String? _quantity;
  String? _createdAt;
  num? _v;

  String? get id => _id ?? "";

  String? get name => _name ?? "";

  String? get description => _description ?? "";

  String? get price => _price ?? "";

  List<AdminUpdateProductImage>? get image => _image ?? [];

  String? get categoryId => _categoryId ?? "";

  String? get brandId => _brandId ?? "";

  String? get quantity => _quantity ?? "";

  String? get createdAt => _createdAt ?? "";

  num? get v => _v ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['price'] = _price;
    if (_image != null) {
      map['image'] = _image?.map((v) => v.toJson()).toList();
    }
    map['categoryId'] = _categoryId;
    map['brandId'] = _brandId;
    map['quantity'] = _quantity;
    map['createdAt'] = _createdAt;
    map['__v'] = _v;
    return map;
  }
}
