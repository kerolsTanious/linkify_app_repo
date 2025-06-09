import 'package:dio/dio.dart';

class ApiManager {
  final Dio _dio;

  ApiManager({required Dio dio}) : _dio = dio;

  Future<Response> postRequest({
    required String baseUrl,
    required String endPoints,
    dynamic body,
    Map<String, dynamic>? headers,
    String? contentType,
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
        headers: headers,
        contentType: contentType,
      ),
    );
    return response;
  }

  Future<Response> patchRequest({
    required String baseUrl,
    required String endPoint,
    required Map<String, dynamic> body,
    Map<String, dynamic>? headers,
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
        headers: headers,
      ),
    );
    return response;
  }

  Future<Response> getRequest({
    required String baseUrl,
    required String endPoint,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  }) async {
    var response = await _dio.get(
      "$baseUrl$endPoint",
      queryParameters: params,
      options: Options(
        headers: headers,
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

  Future<Response> deleteRequest({
    required String baseUrl,
    required String endPoints,
    Map<String, dynamic>? headers,
  }) {
    var response = _dio.delete(
      "$baseUrl$endPoints",
      options: Options(
        headers: headers,
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

  Future<Response> downloadFile({
    required String baseUrl,
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    required String savePath,
    void Function(int received, int total)? onReceiveProgress,
  }) async {
    final response = await _dio.download(
      "$baseUrl$endPoint",
      savePath,
      queryParameters: queryParameters,
      onReceiveProgress: onReceiveProgress,
      options: Options(
        headers: headers,
        followRedirects: false,
        validateStatus: (status) => status! < 500,
      ),
    );
    return response;
  }
}
