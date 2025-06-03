import 'package:dartz/dartz.dart';
import 'package:linkify_app/core/api/api_manager.dart';
import 'package:linkify_app/core/api/end_points.dart';
import 'package:linkify_app/core/constants.dart';
import 'package:linkify_app/features/cart/data/models/add_product_to_cart/AddToCartResponse.dart';
import 'package:linkify_app/features/cart/data/models/clear_cart/ClearCartResponse.dart';
import 'package:linkify_app/features/cart/data/models/delete_product_from_cart/DeleteItemFromCartResponse.dart';
import 'package:linkify_app/features/cart/data/repo/cart_repo.dart';

import '../models/get_products_in_cart/GetProductInCartResponse.dart';

class CartRepoImpl extends CartRepo {
  final ApiManager apiManager;

  CartRepoImpl({required this.apiManager});

  @override
  Future<Either<AddToCartResponse, String>> addToCart({
    required String subcategoryId,
    required String token,
  }) async {
    try {
      var response = await apiManager.postRequest(
        baseUrl: Constants.baseUrl,
        endPoints: EndPoints.addProductToCart,
        body: {
          "subcategoryId": subcategoryId,
        },
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      AddToCartResponse addToCartResponse =
          AddToCartResponse.fromJson(response.data);
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return Left(addToCartResponse);
      } else {
        return Right("Something went wrong. Please try again later.");
      }
    } catch (error) {
      return Right(error.toString());
    }
  }

  @override
  Future<Either<GetProductInCartResponse, String>> getCart(
      {required String token}) async {
    try {
      var response = await apiManager.getRequest(
        baseUrl: Constants.baseUrl,
        endPoint: EndPoints.getAllProductsInCart,
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        GetProductInCartResponse getProductInCartResponse =
            GetProductInCartResponse.fromJson(response.data);
        return Left(getProductInCartResponse);
      } else {
        return Right("Something went wrong. Please try again later.");
      }
    } catch (error) {
      print(error.toString());
      return Right(error.toString());
    }
  }

  @override
  Future<Either<DeleteItemFromCartResponse, String>> deleteItemFromCart({
    required String token,
    required String itemId,
  }) async {
    try {
      var response = await apiManager.deleteRequest(
        baseUrl: Constants.baseUrl,
        endPoints: EndPoints.deleteItemsFromCart(itemId: itemId),
        headers: {"Authorization": "Bearer $token"},
      );
      DeleteItemFromCartResponse deleteItemFromCartResponse =
          DeleteItemFromCartResponse.fromJson(response.data);
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return Left(deleteItemFromCartResponse);
      } else {
        return Right("Something went wrong. Please try again later.");
      }
    } catch (error) {
      return Right(error.toString());
    }
  }

  @override
  Future<Either<GetProductInCartResponse, String>> updateCartItem({
    required String token,
    required String itemId,
    required String quantity,
  }) async {
    try {
      var response = await apiManager.patchRequest(
        baseUrl: Constants.baseUrl,
        endPoint: EndPoints.updateCartItems(itemId: itemId),
        headers: {
          "Authorization": "Bearer $token",
        },
        body: {"quantity": quantity},
      );
      GetProductInCartResponse getProductInCartResponse =
          GetProductInCartResponse.fromJson(response.data);
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return Left(getProductInCartResponse);
      } else {
        return Right("Something went wrong. Please try again later.");
      }
      return Left(getProductInCartResponse);
    } catch (error) {
      return Right(error.toString());
    }
  }

  @override
  Future<Either<ClearCartResponse, String>> clearCart(
      {required String token}) async {
    try {
      var response = await apiManager.deleteRequest(
        baseUrl: Constants.baseUrl,
        endPoints: EndPoints.clearCart,
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        ClearCartResponse clearCartResponse =
            ClearCartResponse.fromJson(response.data);
        return Left(clearCartResponse);
      } else {
        return Right("Something went wrong. Please try again later.");
      }
    } catch (error) {
      return Right(error.toString());
    }
  }
}
