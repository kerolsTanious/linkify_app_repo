import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkify_app/features/payment/data/repo/payment_repo.dart';
import 'package:linkify_app/features/payment/presentation/view_model/save_address_cubit/save_address_state.dart';

class SaveAddressCubit extends Cubit<SaveAddressState> {
  SaveAddressCubit({required this.paymentRepo})
      : super(SaveAddressInitial());

  final PaymentRepo paymentRepo;

  Future<void> saveAddress({
    required String token,
    required String name,
    required String phone,
    required String street,
    required String location,
    String? notes,
  }) async {
    var result = await paymentRepo.saveAddress(
      token: token,
      name: name,
      phone: phone,
      street: street,
      location: location,
      notes: notes ?? "",
    );
    result.fold(
      (response) {
        emit(SaveAddressSuccess(saveAddressResponse: response));
      },
      (error) {
        emit(SaveAddressFailure(errorMessage: error));
      },
    );
  }
}
