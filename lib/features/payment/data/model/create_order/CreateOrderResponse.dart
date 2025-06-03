import 'CreateOrderData.dart';

/// message : "Order created successfully"
/// data : {"_id":"6838a613d1742e7a6103ab49","user":"6838721dd1742e7a6103a909","items":[{"subcategory":{"_id":"680bc7e37fff77f23f0f8536","name":"حليب بدون لاكتوز","price":"45 EGP","image":[{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745602531/LinkifyApp/brands/%D8%AC%D9%87%D9%8A%D9%86%D8%A9/categories/%D8%AD%D9%84%D9%8A%D8%A8/subcategories/%D8%AD%D9%84%D9%8A%D8%A8_%D8%A8%D8%AF%D9%88%D9%86_%D9%84%D8%A7%D9%83%D8%AA%D9%88%D8%B2/jfkxd6cduihl2lsqvm9c.png","public_id":"LinkifyApp/brands/جهينة/categories/حليب/subcategories/حليب_بدون_لاكتوز/jfkxd6cduihl2lsqvm9c","_id":"680bc7e37fff77f23f0f8537"}],"categoryId":{"_id":"680b83060988c86d27de6994","name":"حليب"},"brandId":{"_id":"680a62029a4299c023d2cd67","name":"جهينة","image":[{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745510915/LinkifyApp/brand/image/undefined/sdfhcxajstadfnevyxst.png","public_id":"LinkifyApp/brand/image/undefined/sdfhcxajstadfnevyxst","_id":"680a62029a4299c023d2cd68"}]},"createdAt":"2025-04-25T17:35:31.208Z","__v":0,"id":"680bc7e37fff77f23f0f8536"},"quantity":1,"price":"45 EGP","selectedOptions":{}},{"subcategory":{"_id":"680bc87e7fff77f23f0f8544","name":"حليب خالي من اللاكتوز","price":"55 EGP","image":[{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745602686/LinkifyApp/brands/%D8%AC%D9%87%D9%8A%D9%86%D8%A9/categories/%D8%AD%D9%84%D9%8A%D8%A8/subcategories/%D8%AD%D9%84%D9%8A%D8%A8_%D8%AE%D8%A7%D9%84%D9%8A_%D9%85%D9%86_%D8%A7%D9%84%D9%84%D8%A7%D9%83%D8%AA%D9%88%D8%B2/djx26quypxleqlucabjh.png","public_id":"LinkifyApp/brands/جهينة/categories/حليب/subcategories/حليب_خالي_من_اللاكتوز/djx26quypxleqlucabjh","_id":"680bc87e7fff77f23f0f8545"}],"categoryId":{"_id":"680b83060988c86d27de6994","name":"حليب"},"brandId":{"_id":"680a62029a4299c023d2cd67","name":"جهينة","image":[{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745510915/LinkifyApp/brand/image/undefined/sdfhcxajstadfnevyxst.png","public_id":"LinkifyApp/brand/image/undefined/sdfhcxajstadfnevyxst","_id":"680a62029a4299c023d2cd68"}]},"createdAt":"2025-04-25T17:38:06.591Z","__v":0,"id":"680bc87e7fff77f23f0f8544"},"quantity":1,"price":"55 EGP","selectedOptions":{}}],"shippingAddress":{"_id":"683884b9d1742e7a6103aab3","user":"6838721dd1742e7a6103a909","recipientName":"كيرلس طنيوس","street":"حارة الدكتور مصطفي كامل","country":"Egypt","phone":"01277512154","location":"الزيتون","isDefault":false,"notes":"","createdAt":"2025-05-29T16:00:57.681Z","updatedAt":"2025-05-29T16:00:57.681Z","__v":0,"id":"683884b9d1742e7a6103aab3"},"paymentMethod":"credit_card","deliveryDate":"2025-06-01T18:23:15.222Z","createdAt":"2025-05-29T18:23:15.225Z","updatedAt":"2025-05-29T18:23:15.225Z","__v":0,"id":"6838a613d1742e7a6103ab49"}

class CreateOrderResponse {
  CreateOrderResponse({
    String? message,
    CreateOrderData? data,
  }) {
    _message = message;
    _data = data;
  }

  CreateOrderResponse.fromJson(dynamic json) {
    _message = json['message'];
    _data = json['data'] != null ? CreateOrderData.fromJson(json['data']) : null;
  }

  String? _message;
  CreateOrderData? _data;

  String? get message => _message ?? "";

  CreateOrderData? get data => _data ?? CreateOrderData();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}
