import 'package:linkify_app/features/admin/data/model/admin_delete_product_model/AdminDeleteProductResponse.dart';

sealed class AdminDeleteProductState {}

final class AdminDeleteProductInitial extends AdminDeleteProductState {}

final class AdminDeleteProductLoading extends AdminDeleteProductState {
  final String productId;

  AdminDeleteProductLoading({required this.productId});
}

final class AdminDeleteProductSuccess extends AdminDeleteProductState {
  final AdminDeleteProductResponse adminDeleteProductResponse;
  final String productId;

  AdminDeleteProductSuccess(
      {required this.productId, required this.adminDeleteProductResponse});
}

final class AdminDeleteProductFailure extends AdminDeleteProductState {
  final String error;

  final String productId;

  AdminDeleteProductFailure({required this.productId, required this.error});
}
