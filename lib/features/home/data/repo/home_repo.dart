import 'package:dartz/dartz.dart';
import 'package:linkify_app/features/home/data/model/get_all_brands_model/GetAllBrandsResponse.dart';
import 'package:linkify_app/features/home/data/model/get_all_categories_model/GetAllCategoriesResponse.dart';
import 'package:linkify_app/features/home/data/model/get_all_products_by_category_id/GetAllProductsByCategoryIdResponse.dart';
import 'package:linkify_app/features/home/data/model/get_categories_by_brand_id/GetCategoriesByBrandIdResponse.dart';
import 'package:linkify_app/features/home/data/model/get_profile_model/GetProfileResponse.dart';
import 'package:linkify_app/features/home/data/model/search_model/SearchResponse.dart';
import 'package:linkify_app/features/home/data/model/update_profile_model/UpdateProfileResponse.dart';

abstract class HomeRepo {
  Future<Either<GetAllCategoriesResponse, String>> getAllCategories();

  Future<Either<GetAllBrandsResponse, String>> getAllBrands();

  Future<Either<GetAllProductsByCategoryIdResponse, String>>
      getAllProductsByCategoryId({required String categoryId});

  Future<Either<GetCategoriesByBrandIdResponse, String>> getCategoriesBtBrand(
      {required String brandId});

  Future<Either<GetProfileResponse, String>> getProfile({
    required String token,
    required String role,
  });

  Future<Either<UpdateProfileResponse, String>> updateProfile({
    required String token,
    required String role,
    String? name,
    String? phone,
  });

  Future<Either<SearchResponse, String>> search({
    required String token,
    required String query,
  });
}
