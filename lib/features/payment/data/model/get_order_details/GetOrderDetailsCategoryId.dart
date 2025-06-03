/// _id : "680b8ba744ce52309dc503c4"
/// name : "زبادو"

class GetOrderDetailsCategoryId {
  GetOrderDetailsCategoryId({
    String? id,
    String? name,
  }) {
    _id = id;
    _name = name;
  }

  GetOrderDetailsCategoryId.fromJson(dynamic json) {
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
