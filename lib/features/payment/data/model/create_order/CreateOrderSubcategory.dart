import 'CreateOrderBrandId.dart';
import 'CreateOrderCategoryId.dart';
import 'CreateOrderSubcategoryImage.dart';

/// _id : "680bc7e37fff77f23f0f8536"
/// name : "حليب بدون لاكتوز"
/// price : "45 EGP"
/// image : [{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745602531/LinkifyApp/brands/%D8%AC%D9%87%D9%8A%D9%86%D8%A9/categories/%D8%AD%D9%84%D9%8A%D8%A8/subcategories/%D8%AD%D9%84%D9%8A%D8%A8_%D8%A8%D8%AF%D9%88%D9%86_%D9%84%D8%A7%D9%83%D8%AA%D9%88%D8%B2/jfkxd6cduihl2lsqvm9c.png","public_id":"LinkifyApp/brands/جهينة/categories/حليب/subcategories/حليب_بدون_لاكتوز/jfkxd6cduihl2lsqvm9c","_id":"680bc7e37fff77f23f0f8537"}]
/// categoryId : {"_id":"680b83060988c86d27de6994","name":"حليب"}
/// brandId : {"_id":"680a62029a4299c023d2cd67","name":"جهينة","image":[{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745510915/LinkifyApp/brand/image/undefined/sdfhcxajstadfnevyxst.png","public_id":"LinkifyApp/brand/image/undefined/sdfhcxajstadfnevyxst","_id":"680a62029a4299c023d2cd68"}]}
/// createdAt : "2025-04-25T17:35:31.208Z"
/// __v : 0
/// id : "680bc7e37fff77f23f0f8536"

class CreateOrderSubcategory {
  CreateOrderSubcategory({
    String? id,
    String? name,
    String? price,
    List<CreateOrderSubcategoryImage>? image,
    CreateOrderCategoryId? categoryId,
    CreateOrderBrandId? brandId,
    String? createdAt,
    num? v,
  }) {
    _id = id;
    _name = name;
    _price = price;
    _image = image;
    _categoryId = categoryId;
    _brandId = brandId;
    _createdAt = createdAt;
    _v = v;
  }

  CreateOrderSubcategory.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _price = json['price'];
    if (json['image'] != null) {
      _image = [];
      json['image'].forEach((v) {
        _image?.add(CreateOrderSubcategoryImage.fromJson(v));
      });
    }
    _categoryId = json['categoryId'] != null
        ? CreateOrderCategoryId.fromJson(json['categoryId'])
        : null;
    _brandId =
        json['brandId'] != null ? CreateOrderBrandId.fromJson(json['brandId']) : null;
    _createdAt = json['createdAt'];
    _v = json['__v'];
  }

  String? _id;
  String? _name;
  String? _price;
  List<CreateOrderSubcategoryImage>? _image;
  CreateOrderCategoryId? _categoryId;
  CreateOrderBrandId? _brandId;
  String? _createdAt;
  num? _v;

  String? get id => _id ?? "";

  String? get name => _name ?? "";

  String? get price => _price ?? "";

  List<CreateOrderSubcategoryImage>? get image => _image ?? [];

  CreateOrderCategoryId? get categoryId => _categoryId ?? CreateOrderCategoryId();

  CreateOrderBrandId? get brandId => _brandId ?? CreateOrderBrandId();

  String? get createdAt => _createdAt ?? "";

  num? get v => _v ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['price'] = _price;
    if (_image != null) {
      map['image'] = _image?.map((v) => v.toJson()).toList();
    }
    if (_categoryId != null) {
      map['categoryId'] = _categoryId?.toJson();
    }
    if (_brandId != null) {
      map['brandId'] = _brandId?.toJson();
    }
    map['createdAt'] = _createdAt;
    map['__v'] = _v;
    return map;
  }
}
