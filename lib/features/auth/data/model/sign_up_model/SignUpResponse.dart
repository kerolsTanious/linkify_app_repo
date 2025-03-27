import 'SignUpResponseData.dart';

/// message : "signup successfully"
/// data : {"username":"kerols","email":"nardeentanious97@gmail.com","password":"$2b$08$F8XcEFwCIl/FqluA5JzY0upwQIUpu8i65.VxEDfOwuJiMSwZdChTu","phone":"01277512154","gender":"male","role":"user","confirmEmail":false,"isDeleted":false,"provider":"system","_id":"67e5a959425a26f804bef326","coverImage":[],"viewers":[],"__v":0}

class SignUpResponse {
  SignUpResponse({
    String? message,
    SignUpResponseData? data,
  }) {
    _message = message;
    _data = data;
  }

  SignUpResponse.fromJson(dynamic json) {
    _message = json['message'];
    _data = json['data'] != null ? SignUpResponseData.fromJson(json['data']) : null;
  }

  String? _message;
  SignUpResponseData? _data;

  String? get message => _message ?? "";

  SignUpResponseData? get data => _data ?? SignUpResponseData();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}
