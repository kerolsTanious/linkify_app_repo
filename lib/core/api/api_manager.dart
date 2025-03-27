import 'package:dio/dio.dart';

class ApiManager {
  final Dio _dio;

  ApiManager({required Dio dio}) : _dio = dio;

  Future<Response> postRequest({
    required String baseUrl,
    required String endPoints,
    required Map<String, dynamic> body,
  }) async {
    var response = await _dio.post(
      "$baseUrl$endPoints",
      data: body,
    );
    return response;
  }
}
