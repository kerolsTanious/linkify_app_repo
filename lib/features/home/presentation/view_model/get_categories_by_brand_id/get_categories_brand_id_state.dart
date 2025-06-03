import 'package:linkify_app/features/home/data/model/get_categories_by_brand_id/GetCategoriesByBrandData.dart';

sealed class GetCategoriesBrandIdState {}

final class GetCategoriesBrandIdInitial extends GetCategoriesBrandIdState {}

final class GetCategoriesBrandIdSuccess extends GetCategoriesBrandIdState {
  final List<GetCategoriesByBrandData> getCategoriesByBrandData;

  GetCategoriesBrandIdSuccess({required this.getCategoriesByBrandData});
}

final class GetCategoriesBrandIdLoading extends GetCategoriesBrandIdState {}

final class GetCategoriesBrandIdFailure extends GetCategoriesBrandIdState {
  final String errorMessage;

  GetCategoriesBrandIdFailure({required this.errorMessage});
}
