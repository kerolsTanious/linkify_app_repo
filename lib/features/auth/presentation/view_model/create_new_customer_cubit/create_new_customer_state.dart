import 'package:linkify_app/features/auth/data/model/create_new_customer_stripe/CreateNewCustomerStripeResponse.dart';

sealed class CreateNewCustomerState {}

final class CreateNewCustomerInitial extends CreateNewCustomerState {}

final class CreateNewCustomerSuccess extends CreateNewCustomerState {
  final CreateNewCustomerStripeResponse createNewCustomerStripeResponse;

  CreateNewCustomerSuccess({required this.createNewCustomerStripeResponse});
}

final class CreateNewCustomerFailure extends CreateNewCustomerState {
  final String error;

  CreateNewCustomerFailure({required this.error});
}
