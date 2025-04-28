import 'package:linkify_app/features/home/data/model/get_all_categories_model/GetAllCategoriesResponse.dart';

sealed class GetAllCategoriesState {}

final class GetAllCategoriesInitial extends GetAllCategoriesState {}

final class GetAllCategoriesLoading extends GetAllCategoriesState {}

final class GetAllCategoriesSuccess extends GetAllCategoriesState {
  final GetAllCategoriesResponse getAllCategoriesResponse;

  GetAllCategoriesSuccess({required this.getAllCategoriesResponse});
}

final class GetAllCategoriesFailure extends GetAllCategoriesState {
  final String errorMessage;

  GetAllCategoriesFailure({required this.errorMessage});
}
