import 'package:linkify_app/features/auth/data/model/ForgetPasswordModelResponse.dart';

sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordLoading extends ForgetPasswordState {}

final class ForgetPasswordSuccess extends ForgetPasswordState {
  final ForgetPasswordModelResponse forgetPasswordModelResponse;

  ForgetPasswordSuccess({required this.forgetPasswordModelResponse});
}

final class ForgetPasswordFailure extends ForgetPasswordState {
  final String error;

  ForgetPasswordFailure({required this.error});
}
