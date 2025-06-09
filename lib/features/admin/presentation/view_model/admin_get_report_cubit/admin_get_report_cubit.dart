import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkify_app/features/admin/data/repo/admin_repo.dart';
import 'package:linkify_app/features/admin/presentation/view_model/admin_get_report_cubit/admin_get_report_state.dart';

class AdminGetReportCubit extends Cubit<AdminGetReportState> {
  AdminGetReportCubit({required this.adminRepo})
      : super(AdminGetReportInitial());
  final AdminRepo adminRepo;

  Future<void> getReport({
    required String token,
    void Function(int received, int total)? onReceiveProgress,
  }) async {
    emit(AdminGetReportLoading(progress: 0));
    var result = await adminRepo.adminGetReport(
      token: token,
      onReceiveProgress: (received, total) {
        if (total != -1) {
          double progress = received / total;
          emit(AdminGetReportLoading(progress: progress));
        }
      },
    );
    result.fold(
      (response) {
        emit(AdminGetReportSuccess(report: response));
      },
      (error) {
        emit(AdminGetReportFailure(error: error));
      },
    );
  }
}
