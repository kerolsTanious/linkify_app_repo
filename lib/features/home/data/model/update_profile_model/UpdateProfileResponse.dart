import 'UpdateProfileData.dart';

/// message : "profile updated successfully"
/// data : {"user":{"_id":"6838721dd1742e7a6103a909","username":"kerolos","email":"kerolstanious44@gmail.com","password":"$2b$08$kJT8kVGfra6yfrQMC9oPseCmYqdjGA.Lp1yStTs75tjreCk8qQoW6","phone":"01277512156","gender":"male","role":"user","confirmEmail":true,"isDeleted":false,"provider":"system","coverImage":[],"viewers":[],"__v":0}}

class UpdateProfileResponse {
  UpdateProfileResponse({
    String? message,
    UpdateProfileData? data,
  }) {
    _message = message;
    _data = data;
  }

  UpdateProfileResponse.fromJson(dynamic json) {
    _message = json['message'];
    _data = json['data'] != null ? UpdateProfileData.fromJson(json['data']) : null;
  }

  String? _message;
  UpdateProfileData? _data;

  String? get message => _message ?? "";

  UpdateProfileData? get data => _data ?? UpdateProfileData();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}
