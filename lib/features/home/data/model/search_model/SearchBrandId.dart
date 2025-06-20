/// _id : "680a62cf9a4299c023d2cd76"
/// name : "ابو عوف"

class SearchBrandId {
  SearchBrandId({
    String? id,
    String? name,
  }) {
    _id = id;
    _name = name;
  }

  SearchBrandId.fromJson(dynamic json) {
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
