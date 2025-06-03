import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkify_app/features/home/data/repo/home_repo.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_all_categories_cubit/get_all_categories_state.dart';

class GetAllCategoriesCubit extends Cubit<GetAllCategoriesState> {
  GetAllCategoriesCubit({required this.homeRepo})
      : super(GetAllCategoriesInitial());

  final HomeRepo homeRepo;

  Future<void> getAllCategories() async {
    emit(GetAllCategoriesLoading());
    var result = await homeRepo.getAllCategories();
    result.fold(
      (response) {
        emit(GetAllCategoriesSuccess(allCategoriesData: response.data ?? []));
      },
      (error) {
        emit(GetAllCategoriesFailure(errorMessage: error));
      },
    );
  }
}
