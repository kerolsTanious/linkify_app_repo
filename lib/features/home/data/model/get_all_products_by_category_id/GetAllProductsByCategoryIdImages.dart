/// secure_url : "https://res.cloudinary.com/dvufwchax/image/upload/v1745670615/LinkifyApp/brands/%D9%83%D8%A7%D8%AF%D8%A8%D9%88%D8%B1%D9%8A/categories/%D8%A8%D8%B3%D9%83%D9%88%D9%8A%D8%AA/subcategories/%D8%A8%D8%B3%D9%83%D9%88%D9%8A%D8%AA_%D8%A7%D9%86%D8%B1%D8%A8%D8%AF_%D9%85%D9%86_%D8%A7%D9%88%D8%B1%D9%8A%D9%88_/x2gdnkbbelvv9ucn8n9k.jpg"
/// public_id : "LinkifyApp/brands/كادبوري/categories/بسكويت/subcategories/بسكويت_انربد_من_اوريو_/x2gdnkbbelvv9ucn8n9k"
/// _id : "680cd1d855107332d3460f27"

class GetAllProductsByCategoryIdImages {
  GetAllProductsByCategoryIdImages({
    String? secureUrl,
    String? publicId,
    String? id,
  }) {
    _secureUrl = secureUrl;
    _publicId = publicId;
    _id = id;
  }

  GetAllProductsByCategoryIdImages.fromJson(dynamic json) {
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
