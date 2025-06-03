import 'AddToCartBrandId.dart';
import 'AddToCartCategoryId.dart';
import 'AddToCartImage.dart';

/// _id : "680cd1d855107332d3460f26"
/// name : "بسكويت انربد من اوريو"
/// description : "9 قطع"
/// price : "130 EGP"
/// image : [{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745670615/LinkifyApp/brands/%D9%83%D8%A7%D8%AF%D8%A8%D9%88%D8%B1%D9%8A/categories/%D8%A8%D8%B3%D9%83%D9%88%D9%8A%D8%AA/subcategories/%D8%A8%D8%B3%D9%83%D9%88%D9%8A%D8%AA_%D8%A7%D9%86%D8%B1%D8%A8%D8%AF_%D9%85%D9%86_%D8%A7%D9%88%D8%B1%D9%8A%D9%88_/x2gdnkbbelvv9ucn8n9k.jpg","public_id":"LinkifyApp/brands/كادبوري/categories/بسكويت/subcategories/بسكويت_انربد_من_اوريو_/x2gdnkbbelvv9ucn8n9k","_id":"680cd1d855107332d3460f27","id":"680cd1d855107332d3460f27"}]
/// categoryId : {"_id":"680cd18455107332d3460f1a","name":"بسكويت","id":"680cd18455107332d3460f1a"}
/// brandId : {"_id":"680a630f9a4299c023d2cd7f","name":"كادبوري","image":[{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745511184/LinkifyApp/brand/image/undefined/i7pocecntfgjrvst2qir.jpg","public_id":"LinkifyApp/brand/image/undefined/i7pocecntfgjrvst2qir","_id":"680a630f9a4299c023d2cd80","id":"680a630f9a4299c023d2cd80"}],"id":"680a630f9a4299c023d2cd7f"}
/// id : "680cd1d855107332d3460f26"

class AddToCartSubcategory {
  AddToCartSubcategory({
    String? id,
    String? name,
    String? description,
    String? price,
    List<AddToCartImage>? image,
    AddToCartCategoryId? categoryId,
    AddToCartBrandId? brandId,
  }) {
    _id = id;
    _name = name;
    _description = description;
    _price = price;
    _image = image;
    _categoryId = categoryId;
    _brandId = brandId;
  }

  AddToCartSubcategory.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _description = json['description'];
    _price = json['price'];
    if (json['image'] != null) {
      _image = [];
      json['image'].forEach((v) {
        _image?.add(AddToCartImage.fromJson(v));
      });
    }
    _categoryId = json['categoryId'] != null
        ? AddToCartCategoryId.fromJson(json['categoryId'])
        : null;
    _brandId =
        json['brandId'] != null ? AddToCartBrandId.fromJson(json['brandId']) : null;
  }

  String? _id;
  String? _name;
  String? _description;
  String? _price;
  List<AddToCartImage>? _image;
  AddToCartCategoryId? _categoryId;
  AddToCartBrandId? _brandId;

  String? get id => _id ?? "";

  String? get name => _name ?? "";

  String? get description => _description ?? "";

  String? get price => _price ?? "";

  List<AddToCartImage>? get image => _image ?? [];

  AddToCartCategoryId? get categoryId => _categoryId ?? AddToCartCategoryId();

  AddToCartBrandId? get brandId => _brandId ?? AddToCartBrandId();

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
    return map;
  }
}
