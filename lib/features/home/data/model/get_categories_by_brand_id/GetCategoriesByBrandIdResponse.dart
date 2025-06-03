import 'GetCategoriesByBrandData.dart';

/// message : "Categories retrieved successfully"
/// data : [{"_id":"680cd18455107332d3460f1a","name":"بسكويت","image":[{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745670532/LinkifyApp/brands/%D9%83%D8%A7%D8%AF%D8%A8%D9%88%D8%B1%D9%8A/categories/%D8%A8%D8%B3%D9%83%D9%88%D9%8A%D8%AA/y4ho6ouncjjzurud7gly.jpg","public_id":"LinkifyApp/brands/كادبوري/categories/بسكويت/y4ho6ouncjjzurud7gly","_id":"680cd18455107332d3460f1b"}],"brandId":{"_id":"680a630f9a4299c023d2cd7f","name":"كادبوري","image":[{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745511184/LinkifyApp/brand/image/undefined/i7pocecntfgjrvst2qir.jpg","public_id":"LinkifyApp/brand/image/undefined/i7pocecntfgjrvst2qir","_id":"680a630f9a4299c023d2cd80"}]},"createdAt":"2025-04-26T12:28:52.502Z","__v":0},{"_id":"680cd19a55107332d3460f1f","name":"شوكولاتة","image":[{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745670553/LinkifyApp/brands/%D9%83%D8%A7%D8%AF%D8%A8%D9%88%D8%B1%D9%8A/categories/%D8%B4%D9%88%D9%83%D9%88%D9%84%D8%A7%D8%AA%D8%A9/wphu2phpfawblyxoqoyb.jpg","public_id":"LinkifyApp/brands/كادبوري/categories/شوكولاتة/wphu2phpfawblyxoqoyb","_id":"680cd19a55107332d3460f20"}],"brandId":{"_id":"680a630f9a4299c023d2cd7f","name":"كادبوري","image":[{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745511184/LinkifyApp/brand/image/undefined/i7pocecntfgjrvst2qir.jpg","public_id":"LinkifyApp/brand/image/undefined/i7pocecntfgjrvst2qir","_id":"680a630f9a4299c023d2cd80"}]},"createdAt":"2025-04-26T12:29:14.563Z","__v":0}]

class GetCategoriesByBrandIdResponse {
  GetCategoriesByBrandIdResponse({
    String? message,
    List<GetCategoriesByBrandData>? data,
  }) {
    _message = message;
    _data = data;
  }

  GetCategoriesByBrandIdResponse.fromJson(dynamic json) {
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(GetCategoriesByBrandData.fromJson(v));
      });
    }
  }

  String? _message;
  List<GetCategoriesByBrandData>? _data;

  String? get message => _message ?? "";

  List<GetCategoriesByBrandData>? get data => _data ?? [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
