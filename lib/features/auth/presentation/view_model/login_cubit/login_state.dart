import 'package:linkify_app/features/auth/data/model/login_model/LoginResponseModel.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final LoginResponseModel loginResponseModel;

  LoginSuccess({required this.loginResponseModel});
}

final class LoginFailure extends LoginState {
  final String error;

  LoginFailure({required this.error});
}
