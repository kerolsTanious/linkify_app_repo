import 'package:linkify_app/features/auth/data/model/ConfirmEmailResponseModel.dart';

sealed class ConfirmEmailState {}

final class ConfirmEmailInitial extends ConfirmEmailState {}

final class ConfirmEmailSuccess extends ConfirmEmailState {
  final ConfirmEmailResponse confirmEmailResponse;

  ConfirmEmailSuccess({required this.confirmEmailResponse});
}

final class ConfirmEmailFailure extends ConfirmEmailState {
  final String error;

  ConfirmEmailFailure({required this.error});
}
