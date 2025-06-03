import 'ClearCartData.dart';

/// message : "Cart cleared"
/// data : {"_id":"68387298d1742e7a6103a978","user":"6838721dd1742e7a6103a909","items":[],"updatedAt":"2025-05-30T13:41:38.679Z","createdAt":"2025-05-29T14:43:36.391Z","__v":8,"id":"68387298d1742e7a6103a978"}

class ClearCartResponse {
  ClearCartResponse({
    String? message,
    ClearCartData? data,
  }) {
    _message = message;
    _data = data;
  }

  ClearCartResponse.fromJson(dynamic json) {
    _message = json['message'];
    _data = json['data'] != null ? ClearCartData.fromJson(json['data']) : null;
  }

  String? _message;
  ClearCartData? _data;

  String? get message => _message ?? "";

  ClearCartData? get data => _data ?? ClearCartData();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}
