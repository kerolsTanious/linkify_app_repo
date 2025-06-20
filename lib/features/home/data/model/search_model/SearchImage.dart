/// secure_url : "https://res.cloudinary.com/dvufwchax/image/upload/v1745661736/LinkifyApp/brands/%D8%A7%D8%A8%D9%88_%D8%B9%D9%88%D9%81/categories/%D9%82%D9%87%D9%88%D8%A9_%D9%88_%D9%85%D8%B4%D8%B1%D9%88%D8%A8%D8%A7%D8%AA/subcategories/%D9%82%D9%87%D9%88%D8%A9_%D8%A8%D8%A7%D9%84%D8%B4%D9%88%D9%83%D9%88%D9%84%D8%A7%D8%AA%D8%A9/owfhog49yglp7rxqha41.webp"
/// public_id : "LinkifyApp/brands/ابو_عوف/categories/قهوة_و_مشروبات/subcategories/قهوة_بالشوكولاتة/owfhog49yglp7rxqha41"
/// _id : "680caf2955107332d3460cfc"

class SearchImage {
  SearchImage({
    String? secureUrl,
    String? publicId,
    String? id,
  }) {
    _secureUrl = secureUrl;
    _publicId = publicId;
    _id = id;
  }

  SearchImage.fromJson(dynamic json) {
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
