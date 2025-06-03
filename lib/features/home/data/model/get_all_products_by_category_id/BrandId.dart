/// _id : "680a630f9a4299c023d2cd7f"
/// name : "كادبوري"

class BrandId {
  BrandId({
    String? id,
    String? name,
  }) {
    _id = id;
    _name = name;
  }

  BrandId.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
  }

  String? _id;
  String? _name;

  String? get id => _id ?? "";

  String? get name => _name ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    return map;
  }
}
