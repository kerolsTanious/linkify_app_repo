import 'AllBrandsImage.dart';

/// _id : "680a62029a4299c023d2cd67"
/// name : "جهينة"
/// image : [{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745510915/LinkifyApp/brand/image/undefined/sdfhcxajstadfnevyxst.png","public_id":"LinkifyApp/brand/image/undefined/sdfhcxajstadfnevyxst","_id":"680a62029a4299c023d2cd68"}]
/// createdAt : "2025-04-30T00:14:22.272Z"

class AllBrandsData {
  AllBrandsData({
    String? id,
    String? name,
    List<AllBrandsImage>? image,
    String? createdAt,
  }) {
    _id = id;
    _name = name;
    _image = image;
    _createdAt = createdAt;
  }

  AllBrandsData.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    if (json['image'] != null) {
      _image = [];
      json['image'].forEach((v) {
        _image?.add(AllBrandsImage.fromJson(v));
      });
    }
    _createdAt = json['createdAt'];
  }

  String? _id;
  String? _name;
  List<AllBrandsImage>? _image;
  String? _createdAt;

  String? get id => _id ?? "";

  String? get name => _name ?? "";

  List<AllBrandsImage>? get image => _image ?? [];

  String? get createdAt => _createdAt ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    if (_image != null) {
      map['image'] = _image?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = _createdAt;
    return map;
  }
}
