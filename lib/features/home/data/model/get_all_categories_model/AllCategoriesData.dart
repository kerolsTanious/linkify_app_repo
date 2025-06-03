import 'AllCategoriesImages.dart';

/// _id : "680b83060988c86d27de6994"
/// name : "حليب"
/// image : [{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745584902/LinkifyApp/brands/%D8%AC%D9%87%D9%8A%D9%86%D8%A9/categories/%D8%AD%D9%84%D9%8A%D8%A8/kpj8earxqdqarkrsurwr.jpg","public_id":"LinkifyApp/brands/جهينة/categories/حليب/kpj8earxqdqarkrsurwr","_id":"680b83060988c86d27de6995"}]
/// brandId : "680a62029a4299c023d2cd67"
/// createdAt : "2025-04-25T12:41:42.544Z"
/// __v : 0

class AllCategoriesData {
  AllCategoriesData({
    String? id,
    String? name,
    List<AllCategoriesImages>? image,
    String? brandId,
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

  AllCategoriesData.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    if (json['image'] != null) {
      _image = [];
      json['image'].forEach((v) {
        _image?.add(AllCategoriesImages.fromJson(v));
      });
    }
    _brandId = json['brandId'];
    _createdAt = json['createdAt'];
    _v = json['__v'];
  }

  String? _id;
  String? _name;
  List<AllCategoriesImages>? _image;
  String? _brandId;
  String? _createdAt;
  num? _v;

  String? get id => _id ?? "";

  String? get name => _name ?? "";

  List<AllCategoriesImages>? get image => _image ?? [];

  String? get brandId => _brandId ?? "";

  String? get createdAt => _createdAt ?? "";

  num? get v => _v ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    if (_image != null) {
      map['image'] = _image?.map((v) => v.toJson()).toList();
    }
    map['brandId'] = _brandId;
    map['createdAt'] = _createdAt;
    map['__v'] = _v;
    return map;
  }
}
