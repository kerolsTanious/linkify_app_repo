import 'package:dartz/dartz.dart';
import 'package:linkify_app/features/auth/data/model/ConfirmEmailResponseModel.dart';
import 'package:linkify_app/features/auth/data/model/ForgetPasswordModelResponse.dart';
import 'package:linkify_app/features/auth/data/model/confirm_email_input_model.dart';
import 'package:linkify_app/features/auth/data/model/login_input_model.dart';
import 'package:linkify_app/features/auth/data/model/login_model/LoginResponseModel.dart';
import 'package:linkify_app/features/auth/data/model/sign_up_input_model.dart';
import 'package:linkify_app/features/auth/data/model/sign_up_model/SignUpResponse.dart';

abstract class AuthRepo {
  Future<Either<SignUpResponse, String>> signUp(
      {required SignUpInputModel input});

  Future<Either<ConfirmEmailResponse, String>> confirmEmail(
      {required ConfirmEmailInputModel input});

  Future<Either<LoginResponseModel, String>> login(
      {required LoginInputModel input});

  Future<Either<ForgetPasswordModelResponse, String>> forgetPassword(
      {required String email});
}
