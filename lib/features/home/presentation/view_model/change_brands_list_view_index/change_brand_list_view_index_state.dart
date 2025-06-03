sealed class ChangeBrandListViewIndexState {}

final class ChangeBrandListViewIndexInitial
    extends ChangeBrandListViewIndexState {}

final class ChangeBrandListViewIndexSuccess
    extends ChangeBrandListViewIndexState {
  final int newIndex;

  ChangeBrandListViewIndexSuccess({required this.newIndex});
}
