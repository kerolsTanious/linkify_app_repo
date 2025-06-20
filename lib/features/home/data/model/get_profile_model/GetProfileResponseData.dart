import 'GetProfileUser.dart';

/// user : {"_id":"6838721dd1742e7a6103a909","username":"kerolos Tanious","email":"kerolstanious44@gmail.com","password":"$2b$08$kJT8kVGfra6yfrQMC9oPseCmYqdjGA.Lp1yStTs75tjreCk8qQoW6","phone":"01277512154","gender":"male","role":"user","confirmEmail":true,"isDeleted":false,"provider":"system","coverImage":[],"viewers":[],"__v":0}

class GetProfileData {
  GetProfileData({
    GetProfileUser? user,
  }) {
    _user = user;
  }

  GetProfileData.fromJson(dynamic json) {
    _user = json['user'] != null ? GetProfileUser.fromJson(json['user']) : null;
  }

  GetProfileUser? _user;

  GetProfileUser? get user => _user ?? GetProfileUser();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }
}
