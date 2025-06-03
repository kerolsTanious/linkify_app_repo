/// _id : "680cd18455107332d3460f1a"
/// name : "بسكويت"
/// id : "680cd18455107332d3460f1a"

class CategoryId {
  CategoryId({
    String? id,
    String? name,
  }) {
    _id = id;
    _name = name;
    _id = id;
  }

  CategoryId.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
  }

  String? _id;
  String? _name;

  String? get id => _id;

  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    return map;
  }
}
