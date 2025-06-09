import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:linkify_app/features/admin/data/model/admin_add_product_model/AdminAddProductModelResponse.dart';
import 'package:linkify_app/features/admin/data/model/admin_delete_product_model/AdminDeleteProductResponse.dart';
import 'package:linkify_app/features/admin/data/model/amin_update_product_model/AdminUpdateProductResponse.dart';

abstract class AdminRepo {
  Future<Either<AdminAddProductModelResponse, String>> adminAddProduct({
    required String token,
    required String name,
    required String desc,
    required File image,
    required String categoryId,
    required String brandId,
    required String price,
    required String quantity,
  });

  Future<Either<AdminDeleteProductResponse, String>> adminDeleteProduct({
    required String productId,
    required String token,
  });

  Future<Either<AdminUpdateProductResponse, String>> adminUpdateProduct({
    required String token,
    required String name,
    required String desc,
    required String price,
    required String productId,
  });

  Future<Either<File, String>> adminGetReport({
    required String token,
    void Function(int received, int total)? onReceiveProgress,
  });
}
