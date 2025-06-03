/// id : "cus_SPWG2xDf1fzdZt"
/// type : "customer"

class AssociatedObjects {
  AssociatedObjects({
      String? id, 
      String? type,}){
    _id = id;
    _type = type;
}

  AssociatedObjects.fromJson(dynamic json) {
    _id = json['id'];
    _type = json['type'];
  }
  String? _id;
  String? _type;

  String? get id => _id;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['type'] = _type;
    return map;
  }

}