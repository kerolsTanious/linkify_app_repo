import 'AdminAddProductModelData.dart';

/// message : "Product added successfully"
/// data : {"name":"لبن خالي الدسم","description":"حليب خالي الدسم من جهينة، 1.5 لتر","price":"70","image":[{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1749224288/LinkifyApp/brands/%D8%AC%D9%87%D9%8A%D9%86%D8%A9/categories/%D8%AD%D9%84%D9%8A%D8%A8/%D9%84%D8%A8%D9%86%20%D8%AE%D8%A7%D9%84%D9%8A%20%D8%A7%D9%84%D8%AF%D8%B3%D9%85/athjsomvz8onu1fx5evi.jpg","public_id":"LinkifyApp/brands/جهينة/categories/حليب/لبن خالي الدسم/athjsomvz8onu1fx5evi","_id":"68430b61103867276bd54c26"}],"categoryId":"680b83060988c86d27de6994","brandId":"680a62029a4299c023d2cd67","quantity":"1","_id":"68430b61103867276bd54c25","createdAt":"2025-06-06T15:38:09.496Z","__v":0}

class AdminAddProductModelResponse {
  AdminAddProductModelResponse({
    String? message,
    Data? data,
  }) {
    _message = message;
    _data = data;
  }

  AdminAddProductModelResponse.fromJson(dynamic json) {
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  String? _message;
  Data? _data;

  String? get message => _message ?? "";

  Data? get data => _data ?? Data();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}
