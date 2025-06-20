import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkify_app/features/home/data/repo/home_repo.dart';
import 'package:linkify_app/features/home/presentation/view_model/search_cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this.homeRepo}) : super(SearchInitial());
  final HomeRepo homeRepo;

  Future<void> search({
    required String token,
    required String query,
  }) async {
    emit(SearchLoading());
    var result = await homeRepo.search(
      token: token,
      query: query,
    );
    result.fold(
      (response) {
        emit(SearchSuccess(searchResponse: response));
      },
      (error) {
        emit(SearchFailure(errorMessage: error));
      },
    );
  }
}
