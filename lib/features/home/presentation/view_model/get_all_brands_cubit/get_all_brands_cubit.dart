import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkify_app/features/home/data/repo/home_repo.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_all_brands_cubit/get_all_brands_state.dart';

class GetAllBrandsCubit extends Cubit<GetAllBrandsState> {
  GetAllBrandsCubit({required this.homeRepo}) : super(GetAllBrandsInitial());
  final HomeRepo homeRepo;

  Future<void> getAllBrands() async {
    emit(GetAllBrandsLoading());
    var result = await homeRepo.getAllBrands();
    result.fold(
      (response) {
        emit(GetAllBrandsSuccess(allBrandsData: response.data ?? []));
      },
      (error) {
        emit(GetAllBrandsFailure(errorMessage: error));
      },
    );
  }
}
