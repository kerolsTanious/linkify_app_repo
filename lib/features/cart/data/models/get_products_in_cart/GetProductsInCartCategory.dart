/// _id : "680cc8f355107332d3460e86"
/// name : "بيبسي"
/// id : "680cc8f355107332d3460e86"

class GetProductsInCartCategoryId {
  GetProductsInCartCategoryId({
    String? id,
    String? name,
  }) {
    _id = id;
    _name = name;
    _id = id;
  }

  GetProductsInCartCategoryId.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _id = json['id'];
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
