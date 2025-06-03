/// _id : "683884b9d1742e7a6103aab3"
/// user : "6838721dd1742e7a6103a909"
/// recipientName : "كيرلس طنيوس"
/// street : "حارة الدكتور مصطفي كامل"
/// country : "Egypt"
/// phone : "01277512154"
/// location : "الزيتون"
/// isDefault : false
/// notes : ""
/// createdAt : "2025-05-29T16:00:57.681Z"
/// updatedAt : "2025-05-29T16:00:57.681Z"
/// __v : 0
/// id : "683884b9d1742e7a6103aab3"

class GetOrderDetailsShippingAddress {
  GetOrderDetailsShippingAddress({
    String? id,
    String? user,
    String? recipientName,
    String? street,
    String? country,
    String? phone,
    String? location,
    bool? isDefault,
    String? notes,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) {
    _id = id;
    _user = user;
    _recipientName = recipientName;
    _street = street;
    _country = country;
    _phone = phone;
    _location = location;
    _isDefault = isDefault;
    _notes = notes;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
  }

  GetOrderDetailsShippingAddress.fromJson(dynamic json) {
    _id = json['_id'];
    _user = json['user'];
    _recipientName = json['recipientName'];
    _street = json['street'];
    _country = json['country'];
    _phone = json['phone'];
    _location = json['location'];
    _isDefault = json['isDefault'];
    _notes = json['notes'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }

  String? _id;
  String? _user;
  String? _recipientName;
  String? _street;
  String? _country;
  String? _phone;
  String? _location;
  bool? _isDefault;
  String? _notes;
  String? _createdAt;
  String? _updatedAt;
  num? _v;

  String? get id => _id ?? "";

  String? get user => _user ?? "";

  String? get recipientName => _recipientName ?? "";

  String? get street => _street ?? "";

  String? get country => _country ?? "";

  String? get phone => _phone ?? "";

  String? get location => _location ?? "";

  bool? get isDefault => _isDefault ?? false;

  String? get notes => _notes ?? "";

  String? get createdAt => _createdAt ?? "";

  String? get updatedAt => _updatedAt ?? "";

  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['user'] = _user;
    map['recipientName'] = _recipientName;
    map['street'] = _street;
    map['country'] = _country;
    map['phone'] = _phone;
    map['location'] = _location;
    map['isDefault'] = _isDefault;
    map['notes'] = _notes;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }
}
