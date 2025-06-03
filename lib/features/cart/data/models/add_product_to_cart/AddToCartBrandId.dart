import 'AddToCartImage.dart';

/// _id : "680a630f9a4299c023d2cd7f"
/// name : "كادبوري"
/// image : [{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745511184/LinkifyApp/brand/image/undefined/i7pocecntfgjrvst2qir.jpg","public_id":"LinkifyApp/brand/image/undefined/i7pocecntfgjrvst2qir","_id":"680a630f9a4299c023d2cd80","id":"680a630f9a4299c023d2cd80"}]
/// id : "680a630f9a4299c023d2cd7f"

class AddToCartBrandId {
  AddToCartBrandId({
    String? id,
    String? name,
    List<AddToCartImage>? image,
  }) {
    _id = id;
    _name = name;
    _image = image;
    _id = id;
  }

  AddToCartBrandId.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    if (json['image'] != null) {
      _image = [];
      json['image'].forEach((v) {
        _image?.add(AddToCartImage.fromJson(v));
      });
    }
  }

  String? _id;
  String? _name;
  List<AddToCartImage>? _image;

  String? get id => _id ?? "";

  String? get name => _name ?? "";

  List<AddToCartImage>? get image => _image ?? [];

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
