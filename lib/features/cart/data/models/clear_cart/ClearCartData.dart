/// _id : "68387298d1742e7a6103a978"
/// user : "6838721dd1742e7a6103a909"
/// items : []
/// updatedAt : "2025-05-30T13:41:38.679Z"
/// createdAt : "2025-05-29T14:43:36.391Z"
/// __v : 8
/// id : "68387298d1742e7a6103a978"

class ClearCartData {
  ClearCartData({
    String? id,
    String? user,
    List<dynamic>? items,
    String? updatedAt,
    String? createdAt,
    num? v,
  }) {
    _id = id;
    _user = user;
    _items = items;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _v = v;
  }

  ClearCartData.fromJson(dynamic json) {
    _id = json['_id'];
    _user = json['user'];
    _items = [];
    _updatedAt = json['updatedAt'];
    _createdAt = json['createdAt'];
    _v = json['__v'];
  }

  String? _id;
  String? _user;
  List<dynamic>? _items;
  String? _updatedAt;
  String? _createdAt;
  num? _v;

  String? get id => _id ?? "";

  String? get user => _user ?? "";

  List<dynamic>? get items => _items ?? [];

  String? get updatedAt => _updatedAt ?? "";

  String? get createdAt => _createdAt ?? "";

  num? get v => _v ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['user'] = _user;
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    map['updatedAt'] = _updatedAt;
    map['createdAt'] = _createdAt;
    map['__v'] = _v;
    return map;
  }
}
