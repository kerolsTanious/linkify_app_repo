import 'package:linkify_app/features/home/data/model/get_profile_model/GetProfileResponse.dart';

sealed class GetProfileState {}

final class GetProfileInitial extends GetProfileState {}

final class GetProfileLoading extends GetProfileState {}

final class GetProfileSuccess extends GetProfileState {
  final GetProfileResponse getProfileResponse;

  GetProfileSuccess({required this.getProfileResponse});
}

final class GetProfileFailure extends GetProfileState {
  final String error;

  GetProfileFailure({required this.error});
}
