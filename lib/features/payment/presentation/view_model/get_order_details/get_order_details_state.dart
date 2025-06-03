import 'package:linkify_app/features/payment/data/model/get_order_details/GetOrderDetails.dart';

sealed class GetOrderDetailsState {}

final class GetOrderDetailsInitial extends GetOrderDetailsState {}

final class GetOrderDetailsSuccess extends GetOrderDetailsState {
  final GetOrderDetailsResponse getOrderDetailsResponse;

  GetOrderDetailsSuccess({required this.getOrderDetailsResponse});
}

final class GetOrderDetailsFailure extends GetOrderDetailsState {
  final String error;

  GetOrderDetailsFailure({required this.error});
}
