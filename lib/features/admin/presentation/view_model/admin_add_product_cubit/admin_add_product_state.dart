import 'package:linkify_app/features/admin/data/model/admin_add_product_model/AdminAddProductModelResponse.dart';

sealed class AdminAddProductState {}

final class AdminAddProductInitial extends AdminAddProductState {}

final class AdminAddProductLoading extends AdminAddProductState {}

final class AdminAddProductSuccess extends AdminAddProductState {
  final AdminAddProductModelResponse addProductModelResponse;

  AdminAddProductSuccess({required this.addProductModelResponse});
}

final class AdminAddProductFailure extends AdminAddProductState {
  final String error;

  AdminAddProductFailure({required this.error});
}
