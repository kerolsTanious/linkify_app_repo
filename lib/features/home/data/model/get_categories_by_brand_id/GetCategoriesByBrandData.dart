import 'BrandId.dart';
import 'Image.dart';

/// _id : "680cd18455107332d3460f1a"
/// name : "بسكويت"
/// image : [{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745670532/LinkifyApp/brands/%D9%83%D8%A7%D8%AF%D8%A8%D9%88%D8%B1%D9%8A/categories/%D8%A8%D8%B3%D9%83%D9%88%D9%8A%D8%AA/y4ho6ouncjjzurud7gly.jpg","public_id":"LinkifyApp/brands/كادبوري/categories/بسكويت/y4ho6ouncjjzurud7gly","_id":"680cd18455107332d3460f1b"}]
/// brandId : {"_id":"680a630f9a4299c023d2cd7f","name":"كادبوري","image":[{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745511184/LinkifyApp/brand/image/undefined/i7pocecntfgjrvst2qir.jpg","public_id":"LinkifyApp/brand/image/undefined/i7pocecntfgjrvst2qir","_id":"680a630f9a4299c023d2cd80"}]}
/// createdAt : "2025-04-26T12:28:52.502Z"
/// __v : 0

class GetCategoriesByBrandData {
  GetCategoriesByBrandData({
    String? id,
    String? name,
    List<Image>? image,
    BrandId? brandId,
    String? createdAt,
    num? v,
  }) {
    _id = id;
    _name = name;
    _image = image;
    _brandId = brandId;
    _createdAt = createdAt;
    _v = v;
  }

  GetCategoriesByBrandData.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    if (json['image'] != null) {
      _image = [];
      json['image'].forEach((v) {
        _image?.add(Image.fromJson(v));
      });
    }
    _brandId =
        json['brandId'] != null ? BrandId.fromJson(json['brandId']) : null;
    _createdAt = json['createdAt'];
    _v = json['__v'];
  }

  String? _id;
  String? _name;
  List<Image>? _image;
  BrandId? _brandId;
  String? _createdAt;
  num? _v;

  String? get id => _id ?? "";

  String? get name => _name ?? '';

  List<Image>? get image => _image ?? [];

  BrandId? get brandId => _brandId ?? BrandId();

  String? get createdAt => _createdAt ?? '';

  num? get v => _v ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    if (_image != null) {
      map['image'] = _image?.map((v) => v.toJson()).toList();
    }
    if (_brandId != null) {
      map['brandId'] = _brandId?.toJson();
    }
    map['createdAt'] = _createdAt;
    map['__v'] = _v;
    return map;
  }
}
