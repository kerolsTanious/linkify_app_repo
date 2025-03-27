import 'package:dartz/dartz.dart';
import 'package:linkify_app/core/api/api_manager.dart';
import 'package:linkify_app/core/api/end_points.dart';
import 'package:linkify_app/core/constants.dart';
import 'package:linkify_app/features/auth/data/model/sign_up_input_model.dart';
import 'package:linkify_app/features/auth/data/model/sign_up_model/SignUpResponse.dart';
import 'package:linkify_app/features/auth/data/model/sign_up_model/SignUpResponseData.dart';
import 'package:linkify_app/features/auth/data/repo/sign_up_repo.dart';

class SignUpRepoImpl extends SignUpRepo {
  final ApiManager apiManager;

  SignUpRepoImpl({required this.apiManager});

  @override
  Future<Either<SignUpResponseData, String>> signUp(
      {required SignUpInputModel input}) async {
    try {
      var response = await apiManager.postRequest(
        baseUrl: Constants.baseUrl,
        endPoints: EndPoints.signup,
        body: input.toJson(),
      );
      SignUpResponse signUpResponse = SignUpResponse.fromJson(response.data);
      SignUpResponseData signUpResponseData =
          signUpResponse.data ?? SignUpResponseData();
      return Left(signUpResponseData);
    } catch (error) {
      return Right(error.toString());
    }
  }
}
