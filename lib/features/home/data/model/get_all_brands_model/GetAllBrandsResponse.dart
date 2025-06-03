import 'AllBrandsData.dart';

/// message : "Brands retrieved successfully"
/// data : [{"_id":"680a62029a4299c023d2cd67","name":"جهينة","image":[{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745510915/LinkifyApp/brand/image/undefined/sdfhcxajstadfnevyxst.png","public_id":"LinkifyApp/brand/image/undefined/sdfhcxajstadfnevyxst","_id":"680a62029a4299c023d2cd68"}],"createdAt":"2025-04-30T00:14:22.272Z"},{"_id":"680a62399a4299c023d2cd6d","name":"عبد المعبود","image":[{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745510969/LinkifyApp/brand/image/undefined/opdpbn3xogwal4qig3ow.jpg","public_id":"LinkifyApp/brand/image/undefined/opdpbn3xogwal4qig3ow","_id":"680a62399a4299c023d2cd6e"}],"createdAt":"2025-04-30T00:14:22.273Z"},{"_id":"680a62509a4299c023d2cd70","name":"ليبتون","image":[{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745510992/LinkifyApp/brand/image/undefined/gs9jmjlcxypm5n4yeeji.jpg","public_id":"LinkifyApp/brand/image/undefined/gs9jmjlcxypm5n4yeeji","_id":"680a62509a4299c023d2cd71"}],"createdAt":"2025-04-30T00:14:22.273Z"},{"_id":"680a62cf9a4299c023d2cd76","name":"ابو عوف","image":[{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745511120/LinkifyApp/brand/image/undefined/yarzitmatbuhjpuxvpie.jpg","public_id":"LinkifyApp/brand/image/undefined/yarzitmatbuhjpuxvpie","_id":"680a62cf9a4299c023d2cd77"}],"createdAt":"2025-04-30T00:14:22.273Z"},{"_id":"680a62e39a4299c023d2cd79","name":"بيبسي","image":[{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745511139/LinkifyApp/brand/image/undefined/nhzkx1eblh5cc3yhlpdo.png","public_id":"LinkifyApp/brand/image/undefined/nhzkx1eblh5cc3yhlpdo","_id":"680a62e39a4299c023d2cd7a"}],"createdAt":"2025-04-30T00:14:22.273Z"},{"_id":"680a62f59a4299c023d2cd7c","name":"شيبسي","image":[{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745511158/LinkifyApp/brand/image/undefined/t5tyvguxs2t0ollvr63v.jpg","public_id":"LinkifyApp/brand/image/undefined/t5tyvguxs2t0ollvr63v","_id":"680a62f59a4299c023d2cd7d"}],"createdAt":"2025-04-30T00:14:22.273Z"},{"_id":"680a630f9a4299c023d2cd7f","name":"كادبوري","image":[{"secure_url":"https://res.cloudinary.com/dvufwchax/image/upload/v1745511184/LinkifyApp/brand/image/undefined/i7pocecntfgjrvst2qir.jpg","public_id":"LinkifyApp/brand/image/undefined/i7pocecntfgjrvst2qir","_id":"680a630f9a4299c023d2cd80"}],"createdAt":"2025-04-30T00:14:22.273Z"}]

class GetAllBrandsResponse {
  GetAllBrandsResponse({
    String? message,
    List<AllBrandsData>? data,
  }) {
    _message = message;
    _data = data;
  }

  GetAllBrandsResponse.fromJson(dynamic json) {
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(AllBrandsData.fromJson(v));
      });
    }
  }

  String? _message;
  List<AllBrandsData>? _data;

  String? get message => _message ?? "";

  List<AllBrandsData>? get data => _data ?? [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
