import 'BrandId.dart';
import 'CategoryId.dart';
import 'GetAllProductsByCategoryIdImages.dart';

/// _id : "680cd1d855107332d3460f26"
/// name : "بسكويت انربد من اوريو"
/// description : "9 قطع"
/// price : "130 EGP"
/// image : [{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745670615/LinkifyApp/brands/%D9%83%D8%A7%D8%AF%D8%A8%D9%88%D8%B1%D9%8A/categories/%D8%A8%D8%B3%D9%83%D9%88%D9%8A%D8%AA/subcategories/%D8%A8%D8%B3%D9%83%D9%88%D9%8A%D8%AA_%D8%A7%D9%86%D8%B1%D8%A8%D8%AF_%D9%85%D9%86_%D8%A7%D9%88%D8%B1%D9%8A%D9%88_/x2gdnkbbelvv9ucn8n9k.jpg","public_id":"LinkifyApp/brands/كادبوري/categories/بسكويت/subcategories/بسكويت_انربد_من_اوريو_/x2gdnkbbelvv9ucn8n9k","_id":"680cd1d855107332d3460f27"}]
/// categoryId : {"_id":"680cd18455107332d3460f1a","name":"بسكويت"}
/// brandId : {"_id":"680a630f9a4299c023d2cd7f","name":"كادبوري"}
/// createdAt : "2025-04-26T12:30:16.330Z"
/// __v : 0

class GetAllProductsByCategoryIdData {
  GetAllProductsByCategoryIdData({
    String? id,
    String? name,
    String? description,
    String? price,
    List<GetAllProductsByCategoryIdImages>? image,
    CategoryId? categoryId,
    BrandId? brandId,
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
    _createdAt = createdAt;
    _v = v;
  }

  GetAllProductsByCategoryIdData.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _description = json['description'];
    _price = json['price'];
    if (json['image'] != null) {
      _image = [];
      json['image'].forEach((v) {
        _image?.add(GetAllProductsByCategoryIdImages.fromJson(v));
      });
    }
    _categoryId = json['categoryId'] != null
        ? CategoryId.fromJson(json['categoryId'])
        : null;
    _brandId =
        json['brandId'] != null ? BrandId.fromJson(json['brandId']) : null;
    _createdAt = json['createdAt'];
    _v = json['__v'];
  }

  String? _id;
  String? _name;
  String? _description;
  String? _price;
  List<GetAllProductsByCategoryIdImages>? _image;
  CategoryId? _categoryId;
  BrandId? _brandId;
  String? _createdAt;
  num? _v;

  String? get id => _id ?? "";

  String? get name => _name ?? "";

  String? get description => _description ?? "";

  String? get price => _price ?? "";

  List<GetAllProductsByCategoryIdImages>? get image => _image ?? [];

  CategoryId? get categoryId => _categoryId ?? CategoryId();

  BrandId? get brandId => _brandId ?? BrandId();

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
    if (_categoryId != null) {
      map['categoryId'] = _categoryId?.toJson();
    }
    if (_brandId != null) {
      map['brandId'] = _brandId?.toJson();
    }
    map['createdAt'] = _createdAt;
    map['__v'] = _v;
    return map;
  }
}
