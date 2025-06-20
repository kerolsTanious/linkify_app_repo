import 'UpdateProfileUser.dart';

/// user : {"_id":"6838721dd1742e7a6103a909","username":"kerolos","email":"kerolstanious44@gmail.com","password":"$2b$08$kJT8kVGfra6yfrQMC9oPseCmYqdjGA.Lp1yStTs75tjreCk8qQoW6","phone":"01277512156","gender":"male","role":"user","confirmEmail":true,"isDeleted":false,"provider":"system","coverImage":[],"viewers":[],"__v":0}

class UpdateProfileData {
  UpdateProfileData({
    UpdateProfileUser? user,
  }) {
    _user = user;
  }

  UpdateProfileData.fromJson(dynamic json) {
    _user = json['user'] != null ? UpdateProfileUser.fromJson(json['user']) : null;
  }

  UpdateProfileUser? _user;

  UpdateProfileUser? get user => _user ?? UpdateProfileUser();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }
}
