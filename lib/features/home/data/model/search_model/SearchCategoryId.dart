/// _id : "680cad6e55107332d3460ccf"
/// name : "قهوة و مشروبات"

class SearchCategoryId {
  SearchCategoryId({
    String? id,
    String? name,
  }) {
    _id = id;
    _name = name;
  }

  SearchCategoryId.fromJson(dynamic json) {
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
