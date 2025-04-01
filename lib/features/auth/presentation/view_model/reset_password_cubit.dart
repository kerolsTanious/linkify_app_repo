import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkify_app/features/auth/data/model/reset_password_input_model.dart';
import 'package:linkify_app/features/auth/data/repo/auth_repo.dart';
import 'package:linkify_app/features/auth/presentation/view_model/reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit({required this.authRepo}) : super(ResetPasswordInitial());

  final AuthRepo authRepo;

  Future<void> resetPassword({required ResetPasswordInputModel input}) async {
    emit(ResetPasswordLoading());
    var result = await authRepo.resetPassword(input: input);
    result.fold(
      (response) {
        emit(ResetPasswordSuccess(resetPasswordResponseModel: response));
      },
      (error) {
        emit(ResetPasswordFailure(error: error));
      },
    );
  }
}
