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
      options: Options(
        validateStatus: (status) {
          if (status! < 500) {
            return true;
          }
          return false;
        },
      ),
    );
    return response;
  }

  Future<Response> patchRequest({
    required String baseUrl,
    required String endPoint,
    required Map<String, dynamic> body,
  }) async {
    var response = await _dio.patch(
      "$baseUrl$endPoint",
      data: body,
      options: Options(
        validateStatus: (status) {
          if (status! < 500) {
            return true;
          }
          return false;
        },
      ),
    );
    return response;
  }

  Future<Response> getRequest({
    required String baseUrl,
    required String endPoint,
    Map<String, dynamic>? params,
  }) async {
    var response = await _dio.get(
      "$baseUrl$endPoint",
      queryParameters: params,
      options: Options(
        validateStatus: (status) {
          if (status! < 500) {
            return true;
          }
          return false;
        },
      ),
    );
    return response;
  }
}
