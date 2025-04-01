/// message : "Password reset link has been sent to your email"
/// data : {}

class ForgetPasswordModelResponse {
  ForgetPasswordModelResponse({
    String? message,
    dynamic data,
  }) {
    _message = message;
    _data = data;
  }

  ForgetPasswordModelResponse.fromJson(dynamic json) {
    _message = json['message'];
    _data = json['data'];
  }

  String? _message;
  dynamic _data;

  String? get message => _message ?? "";

  dynamic get data => _data ?? dynamic;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['data'] = _data;
    return map;
  }
}
