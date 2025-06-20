import 'package:linkify_app/features/home/data/model/search_model/SearchResponse.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final SearchResponse searchResponse;

  SearchSuccess({required this.searchResponse});
}

final class SearchFailure extends SearchState {
  final String errorMessage;

  SearchFailure({required this.errorMessage});
}
