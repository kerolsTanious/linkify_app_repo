import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkify_app/features/home/data/repo/home_repo.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_all_products_by_category_id/get_all_products_by_category_id_state.dart';

class GetAllProductsByCategoryIdCubit
    extends Cubit<GetAllProductsByCategoryIdState> {
  GetAllProductsByCategoryIdCubit({required this.homeRepo})
      : super(GetAllProductsByCategoryIdInitial());

  final HomeRepo homeRepo;

  Future<void> getAllProductsByCategoryId({required String categoryId}) async {
    emit(GetAllProductsByCategoryIdLoading());
    var result =
        await homeRepo.getAllProductsByCategoryId(categoryId: categoryId);
    result.fold(
      (response) {
        emit(GetAllProductsByCategoryIdSuccess(
            getAllProductsByCategoryIdData: response.data ?? []));
      },
      (error) {
        emit(GetAllProductsByCategoryIdFailure(errorMessage: error));
      },
    );
  }
}
