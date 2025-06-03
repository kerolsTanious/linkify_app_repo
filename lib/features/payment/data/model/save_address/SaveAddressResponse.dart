import 'SaveAddressData.dart';

/// message : "Address saved successfully"
/// data : {"user":"6838721dd1742e7a6103a909","recipientName":"كيرلس طنيوس","street":"حارة الدكتور مصطفي كامل","country":"Egypt","phone":"01277512154","location":"الزيتون","isDefault":false,"notes":"","_id":"683884b9d1742e7a6103aab3","createdAt":"2025-05-29T16:00:57.681Z","updatedAt":"2025-05-29T16:00:57.681Z","__v":0,"id":"683884b9d1742e7a6103aab3"}

class SaveAddressResponse {
  SaveAddressResponse({
    String? message,
    SaveAddressData? data,
  }) {
    _message = message;
    _data = data;
  }

  SaveAddressResponse.fromJson(dynamic json) {
    _message = json['message'];
    _data = json['data'] != null ? SaveAddressData.fromJson(json['data']) : null;
  }

  String? _message;
  SaveAddressData? _data;

  String? get message => _message ?? "";

  SaveAddressData? get data => _data ?? SaveAddressData();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}
