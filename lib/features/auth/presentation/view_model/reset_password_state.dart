import 'package:linkify_app/features/auth/data/model/ResetPasswordResponseModel.dart';

sealed class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}

final class ResetPasswordLoading extends ResetPasswordState {}

final class ResetPasswordSuccess extends ResetPasswordState {
  final ResetPasswordResponseModel resetPasswordResponseModel;

  ResetPasswordSuccess({required this.resetPasswordResponseModel});
}

final class ResetPasswordFailure extends ResetPasswordState {
  final String error;

  ResetPasswordFailure({required this.error});
}
