import 'GetProductsInCartBrandId.dart';
import 'GetProductsInCartCategory.dart';
import 'GetProductsInCartImage.dart';

/// _id : "680ccd0255107332d3460ee9"
/// name : "سبريت"
/// description : "1 لتر"
/// price : "30 EGP"
/// image : [{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745669377/LinkifyApp/brands/%D8%A8%D9%8A%D8%A8%D8%B3%D9%8A/categories/%D8%A8%D9%8A%D8%A8%D8%B3%D9%8A/subcategories/%D8%B3%D8%A8%D8%B1%D9%8A%D8%AA/jvztuqgnxa5qc8l9d1tp.jpg","public_id":"LinkifyApp/brands/بيبسي/categories/بيبسي/subcategories/سبريت/jvztuqgnxa5qc8l9d1tp","_id":"680ccd0255107332d3460eea","id":"680ccd0255107332d3460eea"}]
/// categoryId : {"_id":"680cc8f355107332d3460e86","name":"بيبسي","id":"680cc8f355107332d3460e86"}
/// brandId : {"_id":"680a62e39a4299c023d2cd79","name":"بيبسي","image":[{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745511139/LinkifyApp/brand/image/undefined/nhzkx1eblh5cc3yhlpdo.png","public_id":"LinkifyApp/brand/image/undefined/nhzkx1eblh5cc3yhlpdo","_id":"680a62e39a4299c023d2cd7a","id":"680a62e39a4299c023d2cd7a"}],"id":"680a62e39a4299c023d2cd79"}
/// createdAt : "2025-04-26T12:09:38.069Z"
/// __v : 0
/// id : "680ccd0255107332d3460ee9"

class GetProductsInCartSubcategory {
  GetProductsInCartSubcategory({
    String? id,
    String? name,
    String? description,
    String? price,
    List<GetProductsInCartImage>? image,
    GetProductsInCartCategoryId? categoryId,
    GetProductsInCartBrandId? brandId,
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

  GetProductsInCartSubcategory.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _description = json['description'];
    _price = json['price'];
    if (json['image'] != null) {
      _image = [];
      json['image'].forEach((v) {
        _image?.add(GetProductsInCartImage.fromJson(v));
      });
    }
    _categoryId = json['categoryId'] != null
        ? GetProductsInCartCategoryId.fromJson(json['categoryId'])
        : null;
    _brandId =
        json['brandId'] != null ? GetProductsInCartBrandId.fromJson(json['brandId']) : null;
    _createdAt = json['createdAt'];
    _v = json['__v'];
  }

  String? _id;
  String? _name;
  String? _description;
  String? _price;
  List<GetProductsInCartImage>? _image;
  GetProductsInCartCategoryId? _categoryId;
  GetProductsInCartBrandId? _brandId;
  String? _createdAt;
  num? _v;

  String? get id => _id ?? "";

  String? get name => _name ?? "";

  String? get description => _description ?? "";

  String? get price => _price ?? "";

  List<GetProductsInCartImage>? get image => _image ?? [];

  GetProductsInCartCategoryId? get categoryId => _categoryId ?? GetProductsInCartCategoryId();

  GetProductsInCartBrandId? get brandId => _brandId ?? GetProductsInCartBrandId();

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
    map['id'] = _id;
    return map;
  }
}
