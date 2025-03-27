/// username : "kerols"
/// email : "nardeentanious97@gmail.com"
/// password : "$2b$08$F8XcEFwCIl/FqluA5JzY0upwQIUpu8i65.VxEDfOwuJiMSwZdChTu"
/// phone : "01277512154"
/// gender : "male"
/// role : "user"
/// confirmEmail : false
/// isDeleted : false
/// provider : "system"
/// _id : "67e5a959425a26f804bef326"
/// coverImage : []
/// viewers : []
/// __v : 0

class SignUpResponseData {
  SignUpResponseData({
    String? username,
    String? email,
    String? password,
    String? phone,
    String? gender,
    String? role,
    bool? confirmEmail,
    bool? isDeleted,
    String? provider,
    String? id,
    List<String>? coverImage,
    List<String>? viewers,
    num? v,
  }) {
    _username = username;
    _email = email;
    _password = password;
    _phone = phone;
    _gender = gender;
    _role = role;
    _confirmEmail = confirmEmail;
    _isDeleted = isDeleted;
    _provider = provider;
    _id = id;
    _coverImage = coverImage;
    _viewers = viewers;
    _v = v;
  }

  SignUpResponseData.fromJson(dynamic json) {
    _username = json['username'];
    _email = json['email'];
    _password = json['password'];
    _phone = json['phone'];
    _gender = json['gender'];
    _role = json['role'];
    _confirmEmail = json['confirmEmail'];
    _isDeleted = json['isDeleted'];
    _provider = json['provider'];
    _id = json['_id'];
    _coverImage = List<String>.from(json['coverImage'] ?? []);
    _viewers = List<String>.from(json['viewers'] ?? []);
    _v = json['__v'];
  }

  String? _username;
  String? _email;
  String? _password;
  String? _phone;
  String? _gender;
  String? _role;
  bool? _confirmEmail;
  bool? _isDeleted;
  String? _provider;
  String? _id;
  List<String>? _coverImage;
  List<String>? _viewers;
  num? _v;

  String? get username => _username ?? "";

  String? get email => _email ?? "";

  String? get password => _password ?? "";

  String? get phone => _phone ?? "";

  String? get gender => _gender ?? "";

  String? get role => _role ?? "";

  bool? get confirmEmail => _confirmEmail ?? false;

  bool? get isDeleted => _isDeleted ?? false;

  String? get provider => _provider ?? "";

  String? get id => _id ?? "";

  List<String>? get coverImage => _coverImage ?? [];

  List<String>? get viewers => _viewers ?? [];

  num? get v => _v ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = _username;
    map['email'] = _email;
    map['password'] = _password;
    map['phone'] = _phone;
    map['gender'] = _gender;
    map['role'] = _role;
    map['confirmEmail'] = _confirmEmail;
    map['isDeleted'] = _isDeleted;
    map['provider'] = _provider;
    map['_id'] = _id;
    map['coverImage'] = _coverImage;
    map['viewers'] = _viewers;
    map['__v'] = _v;
    return map;
  }
}
