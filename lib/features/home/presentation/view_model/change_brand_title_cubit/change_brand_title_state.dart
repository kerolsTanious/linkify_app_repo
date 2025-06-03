sealed class ChangeBrandTitleState {}

final class ChangeBrandTitleInitial extends ChangeBrandTitleState {}

final class ChangeBrandTitleSuccess extends ChangeBrandTitleState {
  final String brandName;

  ChangeBrandTitleSuccess({required this.brandName});
}
