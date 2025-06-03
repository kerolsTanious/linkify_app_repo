import 'package:linkify_app/features/home/data/model/get_all_products_by_category_id/GetAllProductsByCategoryIdData.dart';

sealed class GetAllProductsByCategoryIdState {}

final class GetAllProductsByCategoryIdInitial
    extends GetAllProductsByCategoryIdState {}

final class GetAllProductsByCategoryIdLoading
    extends GetAllProductsByCategoryIdState {}

final class GetAllProductsByCategoryIdSuccess
    extends GetAllProductsByCategoryIdState {
  final List<GetAllProductsByCategoryIdData> getAllProductsByCategoryIdData;

  GetAllProductsByCategoryIdSuccess(
      {required this.getAllProductsByCategoryIdData});
}

final class GetAllProductsByCategoryIdFailure
    extends GetAllProductsByCategoryIdState {
  final String errorMessage;

  GetAllProductsByCategoryIdFailure({required this.errorMessage});
}
