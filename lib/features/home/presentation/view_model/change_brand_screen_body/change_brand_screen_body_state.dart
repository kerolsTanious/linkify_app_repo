sealed class ChangeBrandScreenBodyState {}

final class ChangeBrandScreenBodyInitial extends ChangeBrandScreenBodyState {}

final class ChangeBrandScreenBodySuccess extends ChangeBrandScreenBodyState {
  final int newIndex;

  ChangeBrandScreenBodySuccess({required this.newIndex});
}
