import 'GetOrderDetailsImage.dart';

/// _id : "680a62029a4299c023d2cd67"
/// name : "جهينة"
/// image : [{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745510915/LinkifyApp/brand/image/undefined/sdfhcxajstadfnevyxst.png","public_id":"LinkifyApp/brand/image/undefined/sdfhcxajstadfnevyxst","_id":"680a62029a4299c023d2cd68"}]

class GetOrderDetailsBrandId {
  GetOrderDetailsBrandId({
    String? id,
    String? name,
    List<GetOrderDetailsImage>? image,
  }) {
    _id = id;
    _name = name;
    _image = image;
  }

  GetOrderDetailsBrandId.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    if (json['image'] != null) {
      _image = [];
      json['image'].forEach((v) {
        _image?.add(GetOrderDetailsImage.fromJson(v));
      });
    }
  }

  String? _id;
  String? _name;
  List<GetOrderDetailsImage>? _image;

  String? get id => _id ?? "";

  String? get name => _name ?? "";

  List<GetOrderDetailsImage>? get image => _image ?? [];

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
