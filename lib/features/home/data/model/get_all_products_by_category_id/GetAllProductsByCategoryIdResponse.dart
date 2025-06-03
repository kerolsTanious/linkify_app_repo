import 'GetAllProductsByCategoryIdData.dart';

/// message : "Subcategories retrieved successfully"
/// data : [{"_id":"680cd1d855107332d3460f26","name":"بسكويت انربد من اوريو","description":"9 قطع","price":"130 EGP","image":[{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745670615/LinkifyApp/brands/%D9%83%D8%A7%D8%AF%D8%A8%D9%88%D8%B1%D9%8A/categories/%D8%A8%D8%B3%D9%83%D9%88%D9%8A%D8%AA/subcategories/%D8%A8%D8%B3%D9%83%D9%88%D9%8A%D8%AA_%D8%A7%D9%86%D8%B1%D8%A8%D8%AF_%D9%85%D9%86_%D8%A7%D9%88%D8%B1%D9%8A%D9%88_/x2gdnkbbelvv9ucn8n9k.jpg","public_id":"LinkifyApp/brands/كادبوري/categories/بسكويت/subcategories/بسكويت_انربد_من_اوريو_/x2gdnkbbelvv9ucn8n9k","_id":"680cd1d855107332d3460f27"}],"categoryId":{"_id":"680cd18455107332d3460f1a","name":"بسكويت"},"brandId":{"_id":"680a630f9a4299c023d2cd7f","name":"كادبوري"},"createdAt":"2025-04-26T12:30:16.330Z","__v":0},{"_id":"680cd1f855107332d3460f2d","name":"بسكويت ديلايت بالشوكولاتة","description":"12قطع","price":"84 EGP","image":[{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745670647/LinkifyApp/brands/%D9%83%D8%A7%D8%AF%D8%A8%D9%88%D8%B1%D9%8A/categories/%D8%A8%D8%B3%D9%83%D9%88%D9%8A%D8%AA/subcategories/%D8%A8%D8%B3%D9%83%D9%88%D9%8A%D8%AA_%D8%AF%D9%8A%D9%84%D8%A7%D9%8A%D8%AA_%D8%A8%D8%A7%D9%84%D8%B4%D9%88%D9%83%D9%88%D9%84%D8%A7%D8%AA%D8%A9_/pcyp322lunpna7fwnhjt.jpg","public_id":"LinkifyApp/brands/كادبوري/categories/بسكويت/subcategories/بسكويت_ديلايت_بالشوكولاتة_/pcyp322lunpna7fwnhjt","_id":"680cd1f855107332d3460f2e"}],"categoryId":{"_id":"680cd18455107332d3460f1a","name":"بسكويت"},"brandId":{"_id":"680a630f9a4299c023d2cd7f","name":"كادبوري"},"createdAt":"2025-04-26T12:30:48.334Z","__v":0},{"_id":"680cd21055107332d3460f34","name":"بسكويت شوكولاتة فليك ديبت","description":"12قطع","price":"332 EGP","image":[{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745670672/LinkifyApp/brands/%D9%83%D8%A7%D8%AF%D8%A8%D9%88%D8%B1%D9%8A/categories/%D8%A8%D8%B3%D9%83%D9%88%D9%8A%D8%AA/subcategories/%D8%A8%D8%B3%D9%83%D9%88%D9%8A%D8%AA_%D8%B4%D9%88%D9%83%D9%88%D9%84%D8%A7%D8%AA%D8%A9_%D9%81%D9%84%D9%8A%D9%83_%D8%AF%D9%8A%D8%A8%D8%AA_/ho5od2kqfo645cr9d54k.jpg","public_id":"LinkifyApp/brands/كادبوري/categories/بسكويت/subcategories/بسكويت_شوكولاتة_فليك_ديبت_/ho5od2kqfo645cr9d54k","_id":"680cd21055107332d3460f35"}],"categoryId":{"_id":"680cd18455107332d3460f1a","name":"بسكويت"},"brandId":{"_id":"680a630f9a4299c023d2cd7f","name":"كادبوري"},"createdAt":"2025-04-26T12:31:12.944Z","__v":0},{"_id":"680cd23055107332d3460f3b","name":"مندولين","description":"12قطع","price":"59 EGP","image":[{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745670704/LinkifyApp/brands/%D9%83%D8%A7%D8%AF%D8%A8%D9%88%D8%B1%D9%8A/categories/%D8%A8%D8%B3%D9%83%D9%88%D9%8A%D8%AA/subcategories/%D9%85%D9%86%D8%AF%D9%88%D9%84%D9%8A%D9%86/fwwp6rbk1pe5wmlbkazd.jpg","public_id":"LinkifyApp/brands/كادبوري/categories/بسكويت/subcategories/مندولين/fwwp6rbk1pe5wmlbkazd","_id":"680cd23055107332d3460f3c"}],"categoryId":{"_id":"680cd18455107332d3460f1a","name":"بسكويت"},"brandId":{"_id":"680a630f9a4299c023d2cd7f","name":"كادبوري"},"createdAt":"2025-04-26T12:31:44.502Z","__v":0}]

class GetAllProductsByCategoryIdResponse {
  GetAllProductsByCategoryIdResponse({
    String? message,
    List<GetAllProductsByCategoryIdData>? data,
  }) {
    _message = message;
    _data = data;
  }

  GetAllProductsByCategoryIdResponse.fromJson(dynamic json) {
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(GetAllProductsByCategoryIdData.fromJson(v));
      });
    }
  }

  String? _message;
  List<GetAllProductsByCategoryIdData>? _data;

  String? get message => _message ?? "";

  List<GetAllProductsByCategoryIdData>? get data => _data ?? [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
