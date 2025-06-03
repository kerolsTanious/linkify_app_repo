import 'DeleteItemFromCartData.dart';

/// message : "Item removed successfully"
/// data : {"_id":"681dbaa13e5befb39736678e","user":"6816b7cf2f5bc9eb66f64725","items":[{"subcategory":{"_id":"680cd1d855107332d3460f26","name":"بسكويت انربد من اوريو","description":"9 قطع","price":"130 EGP","image":[{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745670615/LinkifyApp/brands/%D9%83%D8%A7%D8%AF%D8%A8%D9%88%D8%B1%D9%8A/categories/%D8%A8%D8%B3%D9%83%D9%88%D9%8A%D8%AA/subcategories/%D8%A8%D8%B3%D9%83%D9%88%D9%8A%D8%AA_%D8%A7%D9%86%D8%B1%D8%A8%D8%AF_%D9%85%D9%86_%D8%A7%D9%88%D8%B1%D9%8A%D9%88_/x2gdnkbbelvv9ucn8n9k.jpg","public_id":"LinkifyApp/brands/كادبوري/categories/بسكويت/subcategories/بسكويت_انربد_من_اوريو_/x2gdnkbbelvv9ucn8n9k","_id":"680cd1d855107332d3460f27","id":"680cd1d855107332d3460f27"}],"categoryId":{"_id":"680cd18455107332d3460f1a","name":"بسكويت","id":"680cd18455107332d3460f1a"},"brandId":{"_id":"680a630f9a4299c023d2cd7f","name":"كادبوري","image":[{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745511184/LinkifyApp/brand/image/undefined/i7pocecntfgjrvst2qir.jpg","public_id":"LinkifyApp/brand/image/undefined/i7pocecntfgjrvst2qir","_id":"680a630f9a4299c023d2cd80","id":"680a630f9a4299c023d2cd80"}],"id":"680a630f9a4299c023d2cd7f"},"createdAt":"2025-04-26T12:30:16.330Z","__v":0,"id":"680cd1d855107332d3460f26"},"quantity":50,"price":"130 EGP","_id":"6820c9eceebc915fbe0630ad","id":"6820c9eceebc915fbe0630ad"}],"updatedAt":"2025-05-11T16:40:09.117Z","createdAt":"2025-05-09T08:19:45.840Z","__v":4,"id":"681dbaa13e5befb39736678e"}

class DeleteItemFromCartResponse {
  DeleteItemFromCartResponse({
    String? message,
    DeleteItemFromCartData? data,
  }) {
    _message = message;
    _data = data;
  }

  DeleteItemFromCartResponse.fromJson(dynamic json) {
    _message = json['message'];
    _data = json['data'] != null
        ? DeleteItemFromCartData.fromJson(json['data'])
        : null;
  }

  String? _message;
  DeleteItemFromCartData? _data;

  String? get message => _message ?? "";

  DeleteItemFromCartData? get data => _data ?? DeleteItemFromCartData();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}
