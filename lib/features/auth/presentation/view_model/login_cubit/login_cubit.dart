import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkify_app/features/auth/data/model/login_input_model.dart';
import 'package:linkify_app/features/auth/data/repo/auth_repo.dart';
import 'package:linkify_app/features/auth/presentation/view_model/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authRepo}) : super(LoginInitial());

  final AuthRepo authRepo;

  Future<void> login({required LoginInputModel input}) async {
    emit(LoginLoading());
    var result = await authRepo.login(input: input);

    result.fold(
      (response) {
        emit(LoginSuccess(loginResponseModel: response));
      },
      (error) {
        emit(LoginFailure(error: error));
      },
    );
  }
}
