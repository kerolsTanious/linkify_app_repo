import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkify_app/features/admin/data/repo/admin_repo.dart';
import 'package:linkify_app/features/admin/presentation/view_model/admin_delete_product_cubit/admin_delete_product_state.dart';

class AdminDeleteProductCubit extends Cubit<AdminDeleteProductState> {
  AdminDeleteProductCubit({required this.adminRepo})
      : super(AdminDeleteProductInitial());

  final AdminRepo adminRepo;

  Future<void> adminDeleteProduct({
    required String token,
    required String productId,
  }) async {
    emit(AdminDeleteProductLoading(productId: productId));
    var result = await adminRepo.adminDeleteProduct(
      productId: productId,
      token: token,
    );
    result.fold(
      (response) {
        emit(AdminDeleteProductSuccess(
          adminDeleteProductResponse: response,
          productId: productId,
        ));
      },
      (error) {
        emit(AdminDeleteProductFailure(
          error: error,
          productId: productId,
        ));
      },
    );
  }
}
