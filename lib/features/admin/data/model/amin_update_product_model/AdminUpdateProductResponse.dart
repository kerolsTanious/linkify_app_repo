import 'AdminUpdateProductData.dart';

/// message : "Product updated successfully"
/// data : {"_id":"684523668e128c079929ab65","name":"لبن خالي","description":"حليب خالي الدسم من جهينة، 1.5 لتر","price":"70","image":[{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1749361510/LinkifyApp/brands/%D8%AC%D9%87%D9%8A%D9%86%D8%A9/categories/%D8%AD%D9%84%D9%8A%D8%A8/%D9%84%D8%A8%D9%86%20%D8%AE%D8%A7%D9%84%D9%8A%20%D8%A7%D9%84%D8%AF%D8%B3%D9%85/vzcscjd6vtyyqlsyl3al.jpg","public_id":"LinkifyApp/brands/جهينة/categories/حليب/لبن خالي الدسم/vzcscjd6vtyyqlsyl3al","_id":"684523668e128c079929ab66"}],"categoryId":"680b83060988c86d27de6994","brandId":"680a62029a4299c023d2cd67","quantity":"1","createdAt":"2025-06-08T05:45:10.750Z","__v":0}

class AdminUpdateProductResponse {
  AdminUpdateProductResponse({
    String? message,
    AdminUpdateProductData? data,
  }) {
    _message = message;
    _data = data;
  }

  AdminUpdateProductResponse.fromJson(dynamic json) {
    _message = json['message'];
    _data = json['data'] != null ? AdminUpdateProductData.fromJson(json['data']) : null;
  }

  String? _message;
  AdminUpdateProductData? _data;

  String? get message => _message ?? "";

  AdminUpdateProductData? get data => _data ?? AdminUpdateProductData();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}
