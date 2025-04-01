import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkify_app/features/auth/data/repo/auth_repo.dart';
import 'package:linkify_app/features/auth/presentation/view_model/forget_cubit/forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit({required this.authRepo})
      : super(ForgetPasswordInitial());

  final AuthRepo authRepo;

  Future<void> forgetPassword({required String email}) async {
    emit(ForgetPasswordLoading());
    var result = await authRepo.forgetPassword(email: email);
    result.fold(
      (response) {
        emit(ForgetPasswordSuccess(forgetPasswordModelResponse: response));
      },
      (error) {
        emit(ForgetPasswordFailure(error: error));
      },
    );
  }
}
