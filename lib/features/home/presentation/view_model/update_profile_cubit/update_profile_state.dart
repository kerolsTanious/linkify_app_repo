import 'package:linkify_app/features/home/data/model/update_profile_model/UpdateProfileResponse.dart';

sealed class UpdateProfileState {}

final class UpdateProfileInitial extends UpdateProfileState {}

final class UpdateProfileLoading extends UpdateProfileState {}

final class UpdateProfileSuccess extends UpdateProfileState {
  final UpdateProfileResponse updateProfileResponse;

  UpdateProfileSuccess({required this.updateProfileResponse});
}

final class UpdateProfileFailure extends UpdateProfileState {
  final String error;

  UpdateProfileFailure({required this.error});
}
