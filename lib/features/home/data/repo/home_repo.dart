import 'package:dartz/dartz.dart';
import 'package:linkify_app/features/home/data/model/get_all_categories_model/GetAllCategoriesResponse.dart';

abstract class HomeRepo {
  Future<Either<GetAllCategoriesResponse, String>> getAllCategories();
}
