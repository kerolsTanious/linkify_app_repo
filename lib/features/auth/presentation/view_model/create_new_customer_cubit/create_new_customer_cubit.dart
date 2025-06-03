import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkify_app/features/auth/data/repo/auth_repo.dart';
import 'package:linkify_app/features/auth/presentation/view_model/create_new_customer_cubit/create_new_customer_state.dart';

class CreateNewCustomerCubit extends Cubit<CreateNewCustomerState> {
  CreateNewCustomerCubit({required this.authRepo})
      : super(CreateNewCustomerInitial());

  final AuthRepo authRepo;

  Future<void> createNewCustomer() async {
    var response = await authRepo.createNewCustomerStripe();
    response.fold(
      (response) {
        emit(CreateNewCustomerSuccess(
            createNewCustomerStripeResponse: response));
      },
      (error) {
        emit(CreateNewCustomerFailure(error: error));
      },
    );
  }
}
