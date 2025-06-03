import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkify_app/features/payment/data/repo/payment_repo.dart';
import 'package:linkify_app/features/payment/presentation/view_model/get_order_details/get_order_details_state.dart';

class GetOrderDetailsCubit extends Cubit<GetOrderDetailsState> {
  GetOrderDetailsCubit({required this.paymentRepo})
      : super(GetOrderDetailsInitial());

  final PaymentRepo paymentRepo;

  Future<void> getOrderDetails(
      {required String token, required String orderId}) async {
    var result = await paymentRepo.getOrderDetails(
      token: token,
      orderId: orderId,
    );
    result.fold(
      (response) {
        emit(GetOrderDetailsSuccess(getOrderDetailsResponse: response));
      },
      (error) {
        emit(GetOrderDetailsFailure(error: error));
      },
    );
  }
}
