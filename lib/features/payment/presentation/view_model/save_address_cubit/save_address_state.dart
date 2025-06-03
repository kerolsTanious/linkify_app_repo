import 'package:linkify_app/features/payment/data/model/save_address/SaveAddressResponse.dart';

sealed class SaveAddressState {}

final class SaveAddressInitial extends SaveAddressState {}

final class SaveAddressSuccess extends SaveAddressState {
  final SaveAddressResponse saveAddressResponse;

  SaveAddressSuccess({required this.saveAddressResponse});
}

final class SaveAddressFailure extends SaveAddressState {
  final String errorMessage;

  SaveAddressFailure({required this.errorMessage});
}
