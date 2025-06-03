import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkify_app/features/payment/data/model/create_payment_intent_input.dart';
import 'package:linkify_app/features/payment/data/repo/payment_repo.dart';
import 'package:linkify_app/features/payment/presentation/view_model/payment_cubit/payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit({required this.paymentRepo}) : super(PaymentInitial());

  final PaymentRepo paymentRepo;

  Future<void> payment({required CreatePaymentIntentInput input}) async {
    var result = await paymentRepo.makePayment(input: input);
    result.fold(
      (response) {
        emit(PaymentSuccess(createPaymentIntentModelResponse: response));
      },
      (error) {
        emit(PaymentFailure(error: error));
      },
    );
  }
}
