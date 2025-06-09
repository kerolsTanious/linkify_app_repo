import 'package:linkify_app/features/admin/data/model/amin_update_product_model/AdminUpdateProductResponse.dart';

sealed class AdminUpdateProductState {}

final class AdminUpdateProductInitial extends AdminUpdateProductState {}

final class AdminUpdateProductLoading extends AdminUpdateProductState {
  final String productId;

  AdminUpdateProductLoading({required this.productId});
}

final class AdminUpdateProductSuccess extends AdminUpdateProductState {
  final String productId;
  final AdminUpdateProductResponse adminUpdateProductSuccess;

  AdminUpdateProductSuccess(
      {required this.productId, required this.adminUpdateProductSuccess});
}

final class AdminUpdateProductFailure extends AdminUpdateProductState {
  final String productId;
  final String error;

  AdminUpdateProductFailure({required this.productId, required this.error});
}
