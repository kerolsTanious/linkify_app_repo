import 'GetOrderDetailsBrandId.dart';
import 'GetOrderDetailsCategoryId.dart';
import 'GetOrderDetailsImage.dart';

/// _id : "680bc9777fff77f23f0f8552"
/// name : "زبادو خوخ"
/// description : "تم إطلاقه عام 2001 وهو مشروب الزبادي متعدد النكهات، ويتم إنتاجه باستخدام الزبادي وقطع الفاكهة الطازجة. ويعد “زبادو” أفضل الوجبات الخفيفة نظرًا لاحتوائه على البروتين والكربوهيدرات والفيتامينات والمعادن التي يحتاجها الجسم والعقل لتعزيز طاقتهم طوال اليوم. تتوفر منتجات “زبادو” في أربع نكهات لذيذة وهي الفراولة والتوت البري والخوخ والمانجو، وذلك في عبوات بحجم 220 جم و440 جم. ويبلغ تاريخ صلاحية هذه المنتجات أسبوعين من تاريخ الإنتاج."
/// price : "25 EGP"
/// image : [{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745602936/LinkifyApp/brands/%D8%AC%D9%87%D9%8A%D9%86%D8%A9/categories/%D8%B2%D8%A8%D8%A7%D8%AF%D9%88/subcategories/%D8%B2%D8%A8%D8%A7%D8%AF%D9%88_%D8%AE%D9%88%D8%AE/mecao8ausa1onh3yxxal.png","public_id":"LinkifyApp/brands/جهينة/categories/زبادو/subcategories/زبادو_خوخ/mecao8ausa1onh3yxxal","_id":"680bc9777fff77f23f0f8553"}]
/// categoryId : {"_id":"680b8ba744ce52309dc503c4","name":"زبادو"}
/// brandId : {"_id":"680a62029a4299c023d2cd67","name":"جهينة","image":[{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745510915/LinkifyApp/brand/image/undefined/sdfhcxajstadfnevyxst.png","public_id":"LinkifyApp/brand/image/undefined/sdfhcxajstadfnevyxst","_id":"680a62029a4299c023d2cd68"}]}
/// createdAt : "2025-04-25T17:42:15.499Z"
/// __v : 0
/// id : "680bc9777fff77f23f0f8552"

class GetOrderDetailsSubcategory {
  GetOrderDetailsSubcategory({
    String? id,
    String? name,
    String? description,
    String? price,
    List<GetOrderDetailsImage>? image,
    GetOrderDetailsCategoryId? categoryId,
    GetOrderDetailsBrandId? brandId,
    String? createdAt,
    num? v,
  }) {
    _id = id;
    _name = name;
    _description = description;
    _price = price;
    _image = image;
    _categoryId = categoryId;
    _brandId = brandId;
    _createdAt = createdAt;
    _v = v;
  }

  GetOrderDetailsSubcategory.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _description = json['description'];
    _price = json['price'];
    if (json['image'] != null) {
      _image = [];
      json['image'].forEach((v) {
        _image?.add(GetOrderDetailsImage.fromJson(v));
      });
    }
    _categoryId = json['categoryId'] != null
        ? GetOrderDetailsCategoryId.fromJson(json['categoryId'])
        : null;
    _brandId = json['brandId'] != null
        ? GetOrderDetailsBrandId.fromJson(json['brandId'])
        : null;
    _createdAt = json['createdAt'];
    _v = json['__v'];
  }

  String? _id;
  String? _name;
  String? _description;
  String? _price;
  List<GetOrderDetailsImage>? _image;
  GetOrderDetailsCategoryId? _categoryId;
  GetOrderDetailsBrandId? _brandId;
  String? _createdAt;
  num? _v;

  String? get id => _id ?? "";

  String? get name => _name ?? "";

  String? get description => _description ?? "";

  String? get price => _price ?? "";

  List<GetOrderDetailsImage>? get image => _image ?? [];

  GetOrderDetailsCategoryId? get categoryId =>
      _categoryId ?? GetOrderDetailsCategoryId();

  GetOrderDetailsBrandId? get brandId => _brandId ?? GetOrderDetailsBrandId();

  String? get createdAt => _createdAt ?? "";

  num? get v => _v ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
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
