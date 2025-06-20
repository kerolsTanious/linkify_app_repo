import 'SearchBrandId.dart';
import 'SearchCategoryId.dart';
import 'SearchImage.dart';

/// _id : "680caf2955107332d3460cfb"
/// name : "قهوة بالشوكولاتة"
/// description : "200 جرام"
/// price : "150 EGP"
/// image : [{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745661736/LinkifyApp/brands/%D8%A7%D8%A8%D9%88_%D8%B9%D9%88%D9%81/categories/%D9%82%D9%87%D9%88%D8%A9_%D9%88_%D9%85%D8%B4%D8%B1%D9%88%D8%A8%D8%A7%D8%AA/subcategories/%D9%82%D9%87%D9%88%D8%A9_%D8%A8%D8%A7%D9%84%D8%B4%D9%88%D9%83%D9%88%D9%84%D8%A7%D8%AA%D8%A9/owfhog49yglp7rxqha41.webp","public_id":"LinkifyApp/brands/ابو_عوف/categories/قهوة_و_مشروبات/subcategories/قهوة_بالشوكولاتة/owfhog49yglp7rxqha41","_id":"680caf2955107332d3460cfc"}]
/// categoryId : {"_id":"680cad6e55107332d3460ccf","name":"قهوة و مشروبات"}
/// brandId : {"_id":"680a62cf9a4299c023d2cd76","name":"ابو عوف"}
/// createdAt : "2025-04-26T10:02:17.086Z"
/// __v : 0
/// addedBy : "683ef9271e3ae3a956ad2d1f"

class SearchData {
  SearchData({
    String? id,
    String? name,
    String? description,
    String? price,
    List<SearchImage>? image,
    SearchCategoryId? categoryId,
    SearchBrandId? brandId,
    String? createdAt,
    num? v,
    String? addedBy,
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
    _addedBy = addedBy;
  }

  SearchData.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _description = json['description'];
    _price = json['price'];
    if (json['image'] != null) {
      _image = [];
      json['image'].forEach((v) {
        _image?.add(SearchImage.fromJson(v));
      });
    }
    _categoryId = json['categoryId'] != null
        ? SearchCategoryId.fromJson(json['categoryId'])
        : null;
    _brandId =
        json['brandId'] != null ? SearchBrandId.fromJson(json['brandId']) : null;
    _createdAt = json['createdAt'];
    _v = json['__v'];
    _addedBy = json['addedBy'];
  }

  String? _id;
  String? _name;
  String? _description;
  String? _price;
  List<SearchImage>? _image;
  SearchCategoryId? _categoryId;
  SearchBrandId? _brandId;
  String? _createdAt;
  num? _v;
  String? _addedBy;

  String? get id => _id ?? "";

  String? get name => _name ?? "";

  String? get description => _description ?? "";

  String? get price => _price ?? "";

  List<SearchImage>? get image => _image ?? [];

  SearchCategoryId? get categoryId => _categoryId ?? SearchCategoryId();

  SearchBrandId? get brandId => _brandId ?? SearchBrandId();

  String? get createdAt => _createdAt ?? "";

  num? get v => _v ?? 0;

  String? get addedBy => _addedBy ?? "";

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
    map['addedBy'] = _addedBy;
    return map;
  }
}
