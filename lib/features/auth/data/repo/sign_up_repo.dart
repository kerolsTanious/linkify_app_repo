import 'package:dartz/dartz.dart';
import 'package:linkify_app/features/auth/data/model/sign_up_input_model.dart';
import 'package:linkify_app/features/auth/data/model/sign_up_model/SignUpResponseData.dart';

abstract class SignUpRepo {
  Future<Either<SignUpResponseData, String>> signUp(
      {required SignUpInputModel input});
}
