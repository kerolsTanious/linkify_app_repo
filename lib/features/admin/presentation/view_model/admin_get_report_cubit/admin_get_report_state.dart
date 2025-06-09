import 'dart:io';

sealed class AdminGetReportState {}

final class AdminGetReportInitial extends AdminGetReportState {}

final class AdminGetReportLoading extends AdminGetReportState {
  final double? progress;

  AdminGetReportLoading({this.progress});
}

final class AdminGetReportSuccess extends AdminGetReportState {
  final File report;

  AdminGetReportSuccess({required this.report});
}

final class AdminGetReportFailure extends AdminGetReportState {
  final String error;

  AdminGetReportFailure({required this.error});
}
