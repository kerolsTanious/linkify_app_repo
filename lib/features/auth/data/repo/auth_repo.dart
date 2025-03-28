import 'package:dartz/dartz.dart';
import 'package:linkify_app/features/auth/data/model/ConfirmEmailResponseModel.dart';
import 'package:linkify_app/features/auth/data/model/confirm_email_input_model.dart';
import 'package:linkify_app/features/auth/data/model/sign_up_input_model.dart';
import 'package:linkify_app/features/auth/data/model/sign_up_model/SignUpResponseData.dart';

abstract class AuthRepo {
  Future<Either<SignUpResponseData, String>> signUp(
      {required SignUpInputModel input});

  Future<Either<ConfirmEmailResponse, String>> confirmEmail(
      {required ConfirmEmailInputModel input});
}
