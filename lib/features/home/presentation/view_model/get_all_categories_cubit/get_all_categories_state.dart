import '../../../data/model/get_all_categories_model/AllCategoriesData.dart';

sealed class GetAllCategoriesState {}

final class GetAllCategoriesInitial extends GetAllCategoriesState {}

final class GetAllCategoriesLoading extends GetAllCategoriesState {}

final class GetAllCategoriesSuccess extends GetAllCategoriesState {
  final List<AllCategoriesData> allCategoriesData;

  GetAllCategoriesSuccess({required this.allCategoriesData});
}

final class GetAllCategoriesFailure extends GetAllCategoriesState {
  final String errorMessage;

  GetAllCategoriesFailure({required this.errorMessage});
}
