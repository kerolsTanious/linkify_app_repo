import 'GetProfileResponseData.dart';

/// message : "profile retrived successfully"
/// data : {"user":{"_id":"6838721dd1742e7a6103a909","username":"kerolos Tanious","email":"kerolstanious44@gmail.com","password":"$2b$08$kJT8kVGfra6yfrQMC9oPseCmYqdjGA.Lp1yStTs75tjreCk8qQoW6","phone":"01277512154","gender":"male","role":"user","confirmEmail":true,"isDeleted":false,"provider":"system","coverImage":[],"viewers":[],"__v":0}}

class GetProfileResponse {
  GetProfileResponse({
    String? message,
    GetProfileData? data,
  }) {
    _message = message;
    _data = data;
  }

  GetProfileResponse.fromJson(dynamic json) {
    _message = json['message'];
    _data = json['data'] != null ? GetProfileData.fromJson(json['data']) : null;
  }

  String? _message;
  GetProfileData? _data;

  String? get message => _message ?? "";

  GetProfileData? get data => _data ?? GetProfileData();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}
