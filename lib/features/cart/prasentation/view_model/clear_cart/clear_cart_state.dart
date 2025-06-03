import 'package:linkify_app/features/cart/data/models/clear_cart/ClearCartResponse.dart';

sealed class ClearCartState {}

final class ClearCartInitial extends ClearCartState {}

final class ClearCartSuccess extends ClearCartState {
  final ClearCartResponse clearCartResponse;

  ClearCartSuccess({required this.clearCartResponse});
}

final class ClearCartFailure extends ClearCartState {
  final String errorMessage;

  ClearCartFailure({required this.errorMessage});
}
