import 'login_response_data.dart';

/// message : "login successfully"
/// data : {"accessToken":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3ZTZiMjdlYzkzNzdiYzliMmE5Yzk1NCIsImlhdCI6MTc0MzE3MjMwNSwiZXhwIjoxLjhlKzQ1fQ.Z5DasVpop3JL5i4EPhZDRBmg0ISQOUOPDqch7TXOxoE","refreshToken":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3ZTZiMjdlYzkzNzdiYzliMmE5Yzk1NCIsImlhdCI6MTc0MzE3MjMwNSwiZXhwIjoxLjhlKzQ1fQ.cARmdw8dJyxPxGMsaw-3nJ-V-MF7Lbwbpp7-Lpx4mDQ"}

class LoginResponseModel {
  LoginResponseModel({
    String? message,
    LoginResponseData? data,
  }) {
    _message = message;
    _data = data;
  }

  LoginResponseModel.fromJson(dynamic json) {
    _message = json['message'];
    _data = json['data'] != null ? LoginResponseData.fromJson(json['data']) : null;
  }

  String? _message;
  LoginResponseData? _data;

  String? get message => _message ?? "";

  LoginResponseData? get data => _data ?? LoginResponseData();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}
