import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkify_app/features/auth/data/model/confirm_email_input_model.dart';
import 'package:linkify_app/features/auth/data/repo/auth_repo.dart';
import 'package:linkify_app/features/auth/presentation/view_model/confirm_email_cubit/confirm_email_state.dart';

class ConfirmEmailCubit extends Cubit<ConfirmEmailState> {
  ConfirmEmailCubit({required this.authRepo}) : super(ConfirmEmailInitial());

  final AuthRepo authRepo;

  Future<void> confirmEmail({required ConfirmEmailInputModel input}) async {
    var result = await authRepo.confirmEmail(input: input);
    result.fold(
      (response) {
        emit(ConfirmEmailSuccess(confirmEmailResponse: response));
      },
      (error) {
        emit(ConfirmEmailFailure(error: error));
      },
    );
  }
}
