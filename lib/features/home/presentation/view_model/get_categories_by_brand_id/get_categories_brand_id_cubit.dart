import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkify_app/features/home/data/repo/home_repo.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_categories_by_brand_id/get_categories_brand_id_state.dart';

class GetCategoriesBrandIdCubit extends Cubit<GetCategoriesBrandIdState> {
  GetCategoriesBrandIdCubit({required this.homeRepo})
      : super(GetCategoriesBrandIdInitial());

  final HomeRepo homeRepo;

  Future<void> getCategoriesByBrandId({required String brandId}) async {
    var result = await homeRepo.getCategoriesBtBrand(brandId: brandId);
    result.fold(
      (response) {
        emit(GetCategoriesBrandIdSuccess(
            getCategoriesByBrandData: response.data ?? []));
      },
      (error) {
        emit(GetCategoriesBrandIdFailure(errorMessage: error));
      },
    );
  }
}
