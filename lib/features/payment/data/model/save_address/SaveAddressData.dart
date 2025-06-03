/// user : "6838721dd1742e7a6103a909"
/// recipientName : "كيرلس طنيوس"
/// street : "حارة الدكتور مصطفي كامل"
/// country : "Egypt"
/// phone : "01277512154"
/// location : "الزيتون"
/// isDefault : false
/// notes : ""
/// _id : "683884b9d1742e7a6103aab3"
/// createdAt : "2025-05-29T16:00:57.681Z"
/// updatedAt : "2025-05-29T16:00:57.681Z"
/// __v : 0
/// id : "683884b9d1742e7a6103aab3"

class SaveAddressData {
  SaveAddressData({
    String? user,
    String? recipientName,
    String? street,
    String? country,
    String? phone,
    String? location,
    bool? isDefault,
    String? notes,
    String? id,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) {
    _user = user;
    _recipientName = recipientName;
    _street = street;
    _country = country;
    _phone = phone;
    _location = location;
    _isDefault = isDefault;
    _notes = notes;
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
  }

  SaveAddressData.fromJson(dynamic json) {
    _user = json['user'];
    _recipientName = json['recipientName'];
    _street = json['street'];
    _country = json['country'];
    _phone = json['phone'];
    _location = json['location'];
    _isDefault = json['isDefault'];
    _notes = json['notes'];
    _id = json['_id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }

  String? _user;
  String? _recipientName;
  String? _street;
  String? _country;
  String? _phone;
  String? _location;
  bool? _isDefault;
  String? _notes;
  String? _id;
  String? _createdAt;
  String? _updatedAt;
  num? _v;

  String? get user => _user ?? "";

  String? get recipientName => _recipientName ?? "";

  String? get street => _street ?? "";

  String? get country => _country ?? "";

  String? get phone => _phone ?? "";

  String? get location => _location ?? "";

  bool? get isDefault => _isDefault ?? false;

  String? get notes => _notes ?? "";

  String? get id => _id ?? "";

  String? get createdAt => _createdAt ?? "";

  String? get updatedAt => _updatedAt ?? "";

  num? get v => _v ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user'] = _user;
    map['recipientName'] = _recipientName;
    map['street'] = _street;
    map['country'] = _country;
    map['phone'] = _phone;
    map['location'] = _location;
    map['isDefault'] = _isDefault;
    map['notes'] = _notes;
    map['_id'] = _id;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }
}
