import 'package:linkify_app/features/auth/data/model/sign_up_model/SignUpResponse.dart';

sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {
  final SignUpResponse signUpResponseData;

  SignUpSuccess({required this.signUpResponseData});
}

final class SignUpFailure extends SignUpState {
  final String errorMessage;

  SignUpFailure({required this.errorMessage});
}
