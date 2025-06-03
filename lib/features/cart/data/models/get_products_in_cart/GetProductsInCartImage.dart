/// secure_url : "https://res.cloudinary.com/dvufwchax/image/upload/v1745511139/LinkifyApp/brand/image/undefined/nhzkx1eblh5cc3yhlpdo.png"
/// public_id : "LinkifyApp/brand/image/undefined/nhzkx1eblh5cc3yhlpdo"
/// _id : "680a62e39a4299c023d2cd7a"
/// id : "680a62e39a4299c023d2cd7a"

class GetProductsInCartImage {
  GetProductsInCartImage({
    String? secureUrl,
    String? publicId,
    String? id,
  }) {
    _secureUrl = secureUrl;
    _publicId = publicId;
    _id = id;
  }

  GetProductsInCartImage.fromJson(dynamic json) {
    _secureUrl = json['secure_url'];
    _publicId = json['public_id'];
    _id = json['_id'];
  }

  String? _secureUrl;
  String? _publicId;
  String? _id;

  String? get secureUrl => _secureUrl;

  String? get publicId => _publicId;

  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['secure_url'] = _secureUrl;
    map['public_id'] = _publicId;
    map['_id'] = _id;
    return map;
  }
}
