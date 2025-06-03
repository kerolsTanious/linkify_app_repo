import 'package:dartz/dartz.dart';
import 'package:linkify_app/features/home/data/model/get_all_brands_model/GetAllBrandsResponse.dart';
import 'package:linkify_app/features/home/data/model/get_all_categories_model/GetAllCategoriesResponse.dart';
import 'package:linkify_app/features/home/data/model/get_all_products_by_category_id/GetAllProductsByCategoryIdResponse.dart';
import 'package:linkify_app/features/home/data/model/get_categories_by_brand_id/GetCategoriesByBrandIdResponse.dart';

abstract class HomeRepo {
  Future<Either<GetAllCategoriesResponse, String>> getAllCategories();

  Future<Either<GetAllBrandsResponse, String>> getAllBrands();

  Future<Either<GetAllProductsByCategoryIdResponse, String>>
      getAllProductsByCategoryId({required String categoryId});

  Future<Either<GetCategoriesByBrandIdResponse, String>> getCategoriesBtBrand({required String brandId});
}
