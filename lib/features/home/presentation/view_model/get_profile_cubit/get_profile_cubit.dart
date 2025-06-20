import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkify_app/features/home/data/repo/home_repo.dart';
import 'package:linkify_app/features/home/presentation/view_model/get_profile_cubit/get_profile_state.dart';

class GetProfileCubit extends Cubit<GetProfileState> {
  GetProfileCubit({required this.homeRepo}) : super(GetProfileInitial());
  final HomeRepo homeRepo;

  Future<void> getProfile({
    required String token,
    required String role,
  }) async {
    emit(GetProfileLoading());
    var result = await homeRepo.getProfile(token: token, role: role);
    result.fold(
      (response) {
        emit(GetProfileSuccess(getProfileResponse: response));
      },
      (error) {
        emit(GetProfileFailure(error: error));
      },
    );
  }
}
