/// accessToken : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3ZTZiMjdlYzkzNzdiYzliMmE5Yzk1NCIsImlhdCI6MTc0MzE3MjMwNSwiZXhwIjoxLjhlKzQ1fQ.Z5DasVpop3JL5i4EPhZDRBmg0ISQOUOPDqch7TXOxoE"
/// refreshToken : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3ZTZiMjdlYzkzNzdiYzliMmE5Yzk1NCIsImlhdCI6MTc0MzE3MjMwNSwiZXhwIjoxLjhlKzQ1fQ.cARmdw8dJyxPxGMsaw-3nJ-V-MF7Lbwbpp7-Lpx4mDQ"

class LoginResponseData {
  LoginResponseData({
    String? accessToken,
    String? refreshToken,
  }) {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
  }

  LoginResponseData.fromJson(dynamic json) {
    _accessToken = json['accessToken'];
    _refreshToken = json['refreshToken'];
  }

  String? _accessToken;
  String? _refreshToken;

  String? get accessToken => _accessToken ?? "";

  String? get refreshToken => _refreshToken ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['accessToken'] = _accessToken;
    map['refreshToken'] = _refreshToken;
    return map;
  }
}
