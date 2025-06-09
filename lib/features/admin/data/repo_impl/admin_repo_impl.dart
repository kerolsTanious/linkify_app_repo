import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:linkify_app/core/api/api_manager.dart';
import 'package:linkify_app/core/api/end_points.dart';
import 'package:linkify_app/core/constants.dart';
import 'package:linkify_app/features/admin/data/model/admin_add_product_model/AdminAddProductModelResponse.dart';
import 'package:linkify_app/features/admin/data/model/admin_delete_product_model/AdminDeleteProductResponse.dart';
import 'package:linkify_app/features/admin/data/model/amin_update_product_model/AdminUpdateProductResponse.dart';
import 'package:linkify_app/features/admin/data/repo/admin_repo.dart';
import 'package:mime/mime.dart';
import 'package:path_provider/path_provider.dart';

class AdminRepoImpl extends AdminRepo {
  final ApiManager apiManager;

  AdminRepoImpl({required this.apiManager});

  @override
  Future<Either<AdminAddProductModelResponse, String>> adminAddProduct({
    required String token,
    required String name,
    required String desc,
    required File image,
    required String categoryId,
    required String brandId,
    required String price,
    required String quantity,
  }) async {
    try {
      final mimeType = lookupMimeType(image.path);
      print('✅ Detected mimeType => $mimeType');

      final MediaType mediaType =
          MediaType.parse(mimeType ?? 'application/octet-stream');
      MultipartFile multipartImage = await MultipartFile.fromFile(
        image.path,
        filename: image.path.split('/').last,
        contentType: mediaType,
      );

      FormData formData = FormData.fromMap({
        "name": name,
        "image": multipartImage,
        "description": desc,
        "quantity": quantity,
        "price": price,
        "brandId": brandId,
        "categoryId": categoryId,
      });
      print('--- Debugging FormData ---');
      formData.fields.forEach((field) {
        print('Field: ${field.key} = ${field.value}');
      });
      formData.files.forEach((file) {
        print(
            'File: ${file.key}, Filename: ${file.value.filename}, ContentType: ${file.value.contentType}');
      });
      print('--- End Debugging FormData ---');
      var response = await apiManager.postRequest(
        baseUrl: Constants.baseUrl,
        endPoints: EndPoints.adminAddProducts,
        headers: {
          "Authorization": "System $token",
        },
        contentType: "multipart/form-data",
        body: formData,
      );
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        AdminAddProductModelResponse addProductModelResponse =
            AdminAddProductModelResponse.fromJson(response.data);
        return Left(addProductModelResponse);
      } else {
        final errorMsg = response.data['message'] ?? "something went wrong!";
        return Right(errorMsg);
      }
    } catch (error) {
      return Right(error.toString());
    }
  }

  @override
  Future<Either<AdminDeleteProductResponse, String>> adminDeleteProduct(
      {required String productId, required String token}) async {
    try {
      var response = await apiManager.deleteRequest(
          baseUrl: Constants.baseUrl,
          endPoints: EndPoints.adminDeleteProduct(productId: productId),
          headers: {
            "Authorization": "System $token",
          });
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        AdminDeleteProductResponse adminDeleteProductResponse =
            AdminDeleteProductResponse.fromJson(response.data);
        return Left(adminDeleteProductResponse);
      } else {
        final errorMsg = response.data['message'] ?? "something went wrong!";
        return Right(errorMsg);
      }
    } catch (error) {
      return Right(error.toString());
    }
  }

  @override
  Future<Either<AdminUpdateProductResponse, String>> adminUpdateProduct({
    required String token,
    required String name,
    required String desc,
    required String price,
    required String productId,
  }) async {
    try {
      var response = await apiManager.patchRequest(
        baseUrl: Constants.baseUrl,
        endPoint: EndPoints.adminUpdateProduct(productId: productId),
        body: {
          "name": name,
          "description": desc,
          "price": price,
        },
        headers: {
          "Authorization": "System $token",
        },
      );
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        AdminUpdateProductResponse adminUpdateProductResponse =
            AdminUpdateProductResponse.fromJson(response.data);
        return Left(adminUpdateProductResponse);
      } else {
        final errorMsg = response.data['message'] ?? "something went wrong!";
        return Right(errorMsg);
      }
    } catch (error) {
      return Right(error.toString());
    }
  }

  @override
  Future<Either<File, String>> adminGetReport({
    required String token,
    void Function(int received, int total)? onReceiveProgress,
  }) async {
    try {
      final dir = await getTemporaryDirectory();
      final filePath = '${dir.path}/report.pdf';

      var response = await apiManager.downloadFile(
        baseUrl: Constants.baseUrl,
        endPoint: EndPoints.adminGetReport,
        savePath: filePath,
        headers: {"Authorization": "System $token"},
        queryParameters: {"format": "PDF"},
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return Left(File(filePath));
      } else {
        return Right("فشل تحميل التقرير");
      }
    } catch (error) {
      return Right(error.toString());
    }
  }
}
