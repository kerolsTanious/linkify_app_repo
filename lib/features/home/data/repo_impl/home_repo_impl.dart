import 'package:dartz/dartz.dart';
import 'package:linkify_app/core/api/api_manager.dart';
import 'package:linkify_app/core/api/end_points.dart';
import 'package:linkify_app/core/constants.dart';
import 'package:linkify_app/features/home/data/model/get_all_categories_model/GetAllCategoriesResponse.dart';
import 'package:linkify_app/features/home/data/repo/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiManager apiManager;

  HomeRepoImpl({required this.apiManager});

  @override
  Future<Either<GetAllCategoriesResponse, String>> getAllCategories() async {
    try {
      var response = await apiManager.getRequest(
        baseUrl: Constants.baseUrl,
        endPoint: EndPoints.getAllCategories,
      );
      GetAllCategoriesResponse getAllCategoriesResponse =
          GetAllCategoriesResponse.fromJson(response.data);
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return Left(getAllCategoriesResponse);
      } else {
        return const Right("Something went wrong. Please try again later.");
      }
    } catch (error) {
      return Right(error.toString());
    }
  }
}
