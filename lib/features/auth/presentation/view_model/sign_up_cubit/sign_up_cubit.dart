import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkify_app/features/auth/data/model/sign_up_input_model.dart';
import 'package:linkify_app/features/auth/data/repo/sign_up_repo.dart';
import 'package:linkify_app/features/auth/presentation/view_model/sign_up_cubit/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required this.signUpRepo}) : super(SignUpInitial());
  final SignUpRepo signUpRepo;

  Future<void> signUp({required SignUpInputModel input}) async {
    emit(SignUpLoading());
    var result = await signUpRepo.signUp(input: input);
    result.fold(
      (response) {
        emit(SignUpSuccess(signUpResponseData: response));
      },
      (error) {
        emit(SignUpFailure(errorMessage: error));
      },
    );
  }
}
