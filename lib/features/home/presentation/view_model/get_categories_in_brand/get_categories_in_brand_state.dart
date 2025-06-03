sealed class GetCategoriesInBrandState {}

final class GetCategoriesInBrandInitial extends GetCategoriesInBrandState {}

final class GetCategoriesInBrandSuccess extends GetCategoriesInBrandState {
  final bool isSelected;

  GetCategoriesInBrandSuccess({required this.isSelected});
}
