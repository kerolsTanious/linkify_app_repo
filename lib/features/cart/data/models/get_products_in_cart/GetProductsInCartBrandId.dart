import 'GetProductsInCartImage.dart';

/// _id : "680a62e39a4299c023d2cd79"
/// name : "بيبسي"
/// image : [{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745511139/LinkifyApp/brand/image/undefined/nhzkx1eblh5cc3yhlpdo.png","public_id":"LinkifyApp/brand/image/undefined/nhzkx1eblh5cc3yhlpdo","_id":"680a62e39a4299c023d2cd7a","id":"680a62e39a4299c023d2cd7a"}]
/// id : "680a62e39a4299c023d2cd79"

class GetProductsInCartBrandId {
  GetProductsInCartBrandId({
    String? id,
    String? name,
    List<GetProductsInCartImage>? image,
  }) {
    _id = id;
    _name = name;
    _image = image;
  }

  GetProductsInCartBrandId.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    if (json['image'] != null) {
      _image = [];
      json['image'].forEach((v) {
        _image?.add(GetProductsInCartImage.fromJson(v));
      });
    }
  }

  String? _id;
  String? _name;
  List<GetProductsInCartImage>? _image;

  String? get id => _id ?? "";

  String? get name => _name ?? "";

  List<GetProductsInCartImage>? get image => _image ?? [];

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
