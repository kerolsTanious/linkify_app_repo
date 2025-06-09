/// secure_url : "https://res.cloudinary.com/dvufwchax/image/upload/v1749361510/LinkifyApp/brands/%D8%AC%D9%87%D9%8A%D9%86%D8%A9/categories/%D8%AD%D9%84%D9%8A%D8%A8/%D9%84%D8%A8%D9%86%20%D8%AE%D8%A7%D9%84%D9%8A%20%D8%A7%D9%84%D8%AF%D8%B3%D9%85/vzcscjd6vtyyqlsyl3al.jpg"
/// public_id : "LinkifyApp/brands/جهينة/categories/حليب/لبن خالي الدسم/vzcscjd6vtyyqlsyl3al"
/// _id : "684523668e128c079929ab66"

class AdminUpdateProductImage {
  AdminUpdateProductImage({
    String? secureUrl,
    String? publicId,
    String? id,
  }) {
    _secureUrl = secureUrl;
    _publicId = publicId;
    _id = id;
  }

  AdminUpdateProductImage.fromJson(dynamic json) {
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
