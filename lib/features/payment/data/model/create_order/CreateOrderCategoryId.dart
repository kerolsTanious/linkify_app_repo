/// _id : "680b83060988c86d27de6994"
/// name : "حليب"

class CreateOrderCategoryId {
  CreateOrderCategoryId({
    String? id,
    String? name,
  }) {
    _id = id;
    _name = name;
  }

  CreateOrderCategoryId.fromJson(dynamic json) {
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
