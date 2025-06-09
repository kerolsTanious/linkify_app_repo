import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkify_app/features/admin/data/repo/admin_repo.dart';
import 'package:linkify_app/features/admin/presentation/view_model/admin_update_product_cubit/admin_update_product_state.dart';
import 'package:linkify_app/features/cart/prasentation/view_model/add_to_cart_cubit/add_to_cart_state.dart';

class AdminUpdateProductCubit extends Cubit<AdminUpdateProductState> {
  AdminUpdateProductCubit({required this.adminRepo})
      : super(AdminUpdateProductInitial());

  final AdminRepo adminRepo;

  Future<void> adminUpdateProduct({
    required String token,
    required String name,
    required String desc,
    required String price,
    required String productId,
  }) async {
    emit(AdminUpdateProductLoading(productId: productId));
    var result = await adminRepo.adminUpdateProduct(
      token: token,
      name: name,
      desc: desc,
      price: price,
      productId: productId,
    );
    result.fold(
      (response) {
        emit(AdminUpdateProductSuccess(productId: productId, adminUpdateProductSuccess: response));
      },
      (error) {
        emit(AdminUpdateProductFailure(productId: productId, error: error));
      },
    );
  }
}
