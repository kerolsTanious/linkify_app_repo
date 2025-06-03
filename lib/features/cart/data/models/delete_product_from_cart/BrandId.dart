import 'Image.dart';

/// _id : "680a630f9a4299c023d2cd7f"
/// name : "كادبوري"
/// image : [{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745511184/LinkifyApp/brand/image/undefined/i7pocecntfgjrvst2qir.jpg","public_id":"LinkifyApp/brand/image/undefined/i7pocecntfgjrvst2qir","_id":"680a630f9a4299c023d2cd80","id":"680a630f9a4299c023d2cd80"}]
/// id : "680a630f9a4299c023d2cd7f"

class BrandId {
  BrandId({
    String? id,
    String? name,
    List<Image>? image,
  }) {
    _id = id;
    _name = name;
    _image = image;
  }

  BrandId.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    if (json['image'] != null) {
      _image = [];
      json['image'].forEach((v) {
        _image?.add(Image.fromJson(v));
      });
    }
  }

  String? _id;
  String? _name;
  List<Image>? _image;

  String? get id => _id;

  String? get name => _name;

  List<Image>? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    if (_image != null) {
      map['image'] = _image?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
