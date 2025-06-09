import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkify_app/features/admin/data/repo/admin_repo.dart';
import 'package:linkify_app/features/admin/presentation/view_model/admin_add_product_cubit/admin_add_product_state.dart';

class AdminAddProductCubit extends Cubit<AdminAddProductState> {
  AdminAddProductCubit({required this.adminRepo})
      : super(AdminAddProductInitial());
  final AdminRepo adminRepo;

  Future<void> adminAddProduct({
    required String token,
    required String name,
    required String desc,
    required File image,
    required String categoryId,
    required String brandId,
    required String price,
    required String quantity,
  }) async {
    emit(AdminAddProductLoading());
    var result = await adminRepo.adminAddProduct(
      token: token,
      name: name,
      desc: desc,
      image: image,
      categoryId: categoryId,
      brandId: brandId,
      price: price,
      quantity: quantity,
    );
    result.fold(
      (response) {
        emit(AdminAddProductSuccess(addProductModelResponse: response));
      },
      (error) {
        emit(AdminAddProductFailure(error: error));
      },
    );
  }
}
