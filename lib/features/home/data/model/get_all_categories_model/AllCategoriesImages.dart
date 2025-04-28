/// secure_url : "https://res.cloudinary.com/dvufwchax/image/upload/v1745584902/LinkifyApp/brands/%D8%AC%D9%87%D9%8A%D9%86%D8%A9/categories/%D8%AD%D9%84%D9%8A%D8%A8/kpj8earxqdqarkrsurwr.jpg"
/// public_id : "LinkifyApp/brands/جهينة/categories/حليب/kpj8earxqdqarkrsurwr"
/// _id : "680b83060988c86d27de6995"

class AllCategoriesImages {
  AllCategoriesImages({
    String? secureUrl,
    String? publicId,
    String? id,
  }) {
    _secureUrl = secureUrl;
    _publicId = publicId;
    _id = id;
  }

  AllCategoriesImages.fromJson(dynamic json) {
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
