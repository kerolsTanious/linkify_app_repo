/// secure_url : "https://res.cloudinary.com/dvufwchax/image/upload/v1745510915/LinkifyApp/brand/image/undefined/sdfhcxajstadfnevyxst.png"
/// public_id : "LinkifyApp/brand/image/undefined/sdfhcxajstadfnevyxst"
/// _id : "680a62029a4299c023d2cd68"

class CreateOrderSubcategoryImage {
  CreateOrderSubcategoryImage({
    String? secureUrl,
    String? publicId,
    String? id,
  }) {
    _secureUrl = secureUrl;
    _publicId = publicId;
    _id = id;
  }

  CreateOrderSubcategoryImage.fromJson(dynamic json) {
    _secureUrl = json['secure_url'];
    _publicId = json['public_id'];
    _id = json['_id'];
  }

  String? _secureUrl;
  String? _publicId;
  String? _id;

  String? get secureUrl => _secureUrl ?? "";

  String? get publicId => _publicId ?? "";

  String? get id => _id ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['secure_url'] = _secureUrl;
    map['public_id'] = _publicId;
    map['_id'] = _id;
    return map;
  }
}
