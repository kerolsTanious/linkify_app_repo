import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkify_app/features/home/data/repo/home_repo.dart';
import 'package:linkify_app/features/home/presentation/view_model/update_profile_cubit/update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit({required this.homeRepo}) : super(UpdateProfileInitial());

  final HomeRepo homeRepo;

  Future<void> updateProfile({
    required String token,
    required String role,
    String? name,
    String? phone,
  }) async {
    emit(UpdateProfileLoading());
    var result = await homeRepo.updateProfile(
      token: token,
      role: role,
      phone: phone,
      name: name,
    );
    result.fold(
      (response) {
        emit(UpdateProfileSuccess(updateProfileResponse: response));
      },
      (error) {
        emit(UpdateProfileFailure(error: error));
      },
    );
  }
}
