/// _id : "6838721dd1742e7a6103a909"
/// username : "kerolos Tanious"
/// email : "kerolstanious44@gmail.com"
/// password : "$2b$08$kJT8kVGfra6yfrQMC9oPseCmYqdjGA.Lp1yStTs75tjreCk8qQoW6"
/// phone : "01277512154"
/// gender : "male"
/// role : "user"
/// confirmEmail : true
/// isDeleted : false
/// provider : "system"
/// coverImage : []
/// viewers : []
/// __v : 0

class GetProfileUser {
  GetProfileUser({
    String? id,
    String? username,
    String? email,
    String? password,
    String? phone,
    String? gender,
    String? role,
    bool? confirmEmail,
    bool? isDeleted,
    String? provider,
    List<String>? coverImage,
    List<String>? viewers,
    num? v,
  }) {
    _id = id;
    _username = username;
    _email = email;
    _password = password;
    _phone = phone;
    _gender = gender;
    _role = role;
    _confirmEmail = confirmEmail;
    _isDeleted = isDeleted;
    _provider = provider;
    _coverImage = coverImage;
    _viewers = viewers;
    _v = v;
  }

  GetProfileUser.fromJson(dynamic json) {
    _id = json['_id'];
    _username = json['username'];
    _email = json['email'];
    _password = json['password'];
    _phone = json['phone'];
    _gender = json['gender'];
    _role = json['role'];
    _confirmEmail = json['confirmEmail'];
    _isDeleted = json['isDeleted'];
    _provider = json['provider'];
    if (json['coverImage'] != null) {
      _coverImage = [];
      _coverImage = List<String>.from(json['coverImage'].map((x) => x));
    }
    if (json['viewers'] != null) {
      _viewers = [];
      _viewers = List<String>.from(json['viewers'].map((x) => x));
    }
    _v = json['__v'];
  }

  String? _id;
  String? _username;
  String? _email;
  String? _password;
  String? _phone;
  String? _gender;
  String? _role;
  bool? _confirmEmail;
  bool? _isDeleted;
  String? _provider;
  List<String>? _coverImage;
  List<String>? _viewers;
  num? _v;

  String? get id => _id ?? "";

  String? get username => _username ?? "";

  String? get email => _email ?? "";

  String? get password => _password ?? "";

  String? get phone => _phone ?? "";

  String? get gender => _gender ?? "";

  String? get role => _role ?? "";

  bool? get confirmEmail => _confirmEmail ?? false;

  bool? get isDeleted => _isDeleted ?? false;

  String? get provider => _provider ?? "";

  List<String>? get coverImage => _coverImage ?? [];

  List<String>? get viewers => _viewers ?? [];

  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['username'] = _username;
    map['email'] = _email;
    map['password'] = _password;
    map['phone'] = _phone;
    map['gender'] = _gender;
    map['role'] = _role;
    map['confirmEmail'] = _confirmEmail;
    map['isDeleted'] = _isDeleted;
    map['provider'] = _provider;
    if (_coverImage != null) {
      map['coverImage'] = _coverImage;
    }
    if (_viewers != null) {
      map['viewers'] = _viewers;
    }
    map['__v'] = _v;
    return map;
  }
}
