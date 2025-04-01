import 'package:dartz/dartz.dart';
import 'package:linkify_app/core/api/api_manager.dart';
import 'package:linkify_app/core/api/end_points.dart';
import 'package:linkify_app/core/constants.dart';
import 'package:linkify_app/features/auth/data/model/ConfirmEmailResponseModel.dart';
import 'package:linkify_app/features/auth/data/model/ForgetPasswordModelResponse.dart';
import 'package:linkify_app/features/auth/data/model/ResetPasswordResponseModel.dart';
import 'package:linkify_app/features/auth/data/model/confirm_email_input_model.dart';
import 'package:linkify_app/features/auth/data/model/login_input_model.dart';
import 'package:linkify_app/features/auth/data/model/login_model/LoginResponseModel.dart';
import 'package:linkify_app/features/auth/data/model/reset_password_input_model.dart';
import 'package:linkify_app/features/auth/data/model/sign_up_input_model.dart';
import 'package:linkify_app/features/auth/data/model/sign_up_model/SignUpResponse.dart';
import 'package:linkify_app/features/auth/data/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiManager apiManager;

  AuthRepoImpl({required this.apiManager});

  @override
  Future<Either<SignUpResponse, String>> signUp(
      {required SignUpInputModel input}) async {
    try {
      var response = await apiManager.postRequest(
        baseUrl: Constants.baseUrl,
        endPoints: EndPoints.signup,
        body: input.toJson(),
      );
      SignUpResponse signUpResponse = SignUpResponse.fromJson(response.data);
      if (response.statusCode == 400 ||
          response.statusCode == 409 ||
          response.statusCode == 404) {
        return Right(signUpResponse.message ?? "");
      } else {
        return Left(signUpResponse);
      }
    } catch (error) {
      return Right(error.toString());
    }
  }

  @override
  Future<Either<ConfirmEmailResponse, String>> confirmEmail(
      {required ConfirmEmailInputModel input}) async {
    try {
      var response = await apiManager.patchRequest(
        baseUrl: Constants.baseUrl,
        endPoint: EndPoints.confirmEmail,
        body: input.toJson(),
      );
      ConfirmEmailResponse confirmEmailResponse =
          ConfirmEmailResponse.fromJson(response.data);
      if (response.statusCode == 400 ||
          response.statusCode == 404 ||
          response.statusCode == 409) {
        return Right(confirmEmailResponse.message ?? "");
      } else {
        return Left(confirmEmailResponse);
      }
    } catch (error) {
      return Right(error.toString());
    }
  }

  @override
  Future<Either<LoginResponseModel, String>> login(
      {required LoginInputModel input}) async {
    try {
      var response = await apiManager.postRequest(
        baseUrl: Constants.baseUrl,
        endPoints: EndPoints.login,
        body: input.toJson(),
      );
      LoginResponseModel loginResponseModel =
          LoginResponseModel.fromJson(response.data);
      if (response.statusCode == 400 ||
          response.statusCode == 404 ||
          response.statusCode == 409) {
        return Right(loginResponseModel.message ?? "");
      } else {
        return Left(loginResponseModel);
      }
    } catch (error) {
      return Right(error.toString());
    }
  }

  @override
  Future<Either<ForgetPasswordModelResponse, String>> forgetPassword(
      {required String email}) async {
    try {
      var response = await apiManager.patchRequest(
        baseUrl: Constants.baseUrl,
        endPoint: EndPoints.forgetPassword,
        body: {"email": email},
      );
      ForgetPasswordModelResponse forgetPasswordModelResponse =
          ForgetPasswordModelResponse.fromJson(response.data);
      if (response.statusCode == 400 ||
          response.statusCode == 404 ||
          response.statusCode == 409) {
        return Right(forgetPasswordModelResponse.message ?? "");
      } else {
        return Left(forgetPasswordModelResponse);
      }
    } catch (e) {
      return Right(e.toString());
    }
  }

  @override
  Future<Either<ResetPasswordResponseModel, String>> resetPassword(
      {required ResetPasswordInputModel input}) async {
    try {
      var response = await apiManager.patchRequest(
        baseUrl: Constants.baseUrl,
        endPoint: EndPoints.resetPassword,
        body: input.toJson(),
      );
      ResetPasswordResponseModel resetPasswordResponseModel =
          ResetPasswordResponseModel.fromJson(response.data);
      if (response.statusCode == 400 ||
          response.statusCode == 404 ||
          response.statusCode == 409) {
        return Right(resetPasswordResponseModel.message ?? "");
      } else {
        return Left(resetPasswordResponseModel);
      }
    } catch (error) {
      return Right(error.toString());
    }
  }
}
