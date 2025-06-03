import 'GetOrderDetailsSubcategory.dart';

/// subcategory : {"_id":"680bc9777fff77f23f0f8552","name":"زبادو خوخ","description":"تم إطلاقه عام 2001 وهو مشروب الزبادي متعدد النكهات، ويتم إنتاجه باستخدام الزبادي وقطع الفاكهة الطازجة. ويعد “زبادو” أفضل الوجبات الخفيفة نظرًا لاحتوائه على البروتين والكربوهيدرات والفيتامينات والمعادن التي يحتاجها الجسم والعقل لتعزيز طاقتهم طوال اليوم. تتوفر منتجات “زبادو” في أربع نكهات لذيذة وهي الفراولة والتوت البري والخوخ والمانجو، وذلك في عبوات بحجم 220 جم و440 جم. ويبلغ تاريخ صلاحية هذه المنتجات أسبوعين من تاريخ الإنتاج.","price":"25 EGP","image":[{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745602936/LinkifyApp/brands/%D8%AC%D9%87%D9%8A%D9%86%D8%A9/categories/%D8%B2%D8%A8%D8%A7%D8%AF%D9%88/subcategories/%D8%B2%D8%A8%D8%A7%D8%AF%D9%88_%D8%AE%D9%88%D8%AE/mecao8ausa1onh3yxxal.png","public_id":"LinkifyApp/brands/جهينة/categories/زبادو/subcategories/زبادو_خوخ/mecao8ausa1onh3yxxal","_id":"680bc9777fff77f23f0f8553"}],"categoryId":{"_id":"680b8ba744ce52309dc503c4","name":"زبادو"},"brandId":{"_id":"680a62029a4299c023d2cd67","name":"جهينة","image":[{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745510915/LinkifyApp/brand/image/undefined/sdfhcxajstadfnevyxst.png","public_id":"LinkifyApp/brand/image/undefined/sdfhcxajstadfnevyxst","_id":"680a62029a4299c023d2cd68"}]},"createdAt":"2025-04-25T17:42:15.499Z","__v":0,"id":"680bc9777fff77f23f0f8552"}
/// quantity : 1
/// price : "25 EGP"
/// selectedOptions : {}

class GetOrderDetailsItems {
  GetOrderDetailsItems({
    GetOrderDetailsSubcategory? subcategory,
    num? quantity,
    String? price,
    dynamic selectedOptions,
  }) {
    _subcategory = subcategory;
    _quantity = quantity;
    _price = price;
    _selectedOptions = selectedOptions;
  }

  GetOrderDetailsItems.fromJson(dynamic json) {
    _subcategory = json['subcategory'] != null
        ? GetOrderDetailsSubcategory.fromJson(json['subcategory'])
        : null;
    _quantity = json['quantity'];
    _price = json['price'];
    _selectedOptions = json['selectedOptions'];
  }

  GetOrderDetailsSubcategory? _subcategory;
  num? _quantity;
  String? _price;
  dynamic _selectedOptions;

  GetOrderDetailsSubcategory? get subcategory => _subcategory ?? GetOrderDetailsSubcategory();

  num? get quantity => _quantity ?? 0;

  String? get price => _price ?? "";

  dynamic get selectedOptions => _selectedOptions ?? dynamic;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_subcategory != null) {
      map['subcategory'] = _subcategory?.toJson();
    }
    map['quantity'] = _quantity;
    map['price'] = _price;
    map['selectedOptions'] = _selectedOptions;
    return map;
  }
}
