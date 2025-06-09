import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:linkify_app/core/prefs.dart';
import 'package:linkify_app/core/utils/assets_manager.dart';
import 'package:linkify_app/core/utils/color_manager.dart';
import 'package:linkify_app/core/utils/styles_manager.dart';
import 'package:linkify_app/features/admin/presentation/view_model/admin_get_report_cubit/admin_get_report_cubit.dart';
import 'package:linkify_app/features/admin/presentation/view_model/admin_get_report_cubit/admin_get_report_state.dart';
import 'package:open_file/open_file.dart';

class AdminGetReportBody extends StatelessWidget {
  const AdminGetReportBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Center(
        child: BlocBuilder<AdminGetReportCubit, AdminGetReportState>(
          builder: (context, state) {
            if (state is AdminGetReportLoading) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 60.h,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_outlined,
                              color: ColorManager.texColor,
                            ),
                            onPressed: () {
                              context.pop();
                            },
                          ),
                        ),
                        Center(
                          child: Text(
                            "عرض تقرير مفصل بي الطلبات",
                            style: Styles.textStyle24.copyWith(
                              color: ColorManager.texColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  const CircularProgressIndicator(
                    color: Colors.white,
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    _getProgressText(state.progress),
                    style: Styles.textStyle24.copyWith(
                      color: ColorManager.texColor,
                    ),
                  ),
                ],
              );
            } else if (state is AdminGetReportSuccess) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 60.h,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_outlined,
                              color: ColorManager.texColor,
                            ),
                            onPressed: () {
                              context.pop();
                            },
                          ),
                        ),
                        Center(
                          child: Text(
                            "عرض تقرير مفصل بي الطلبات",
                            style: Styles.textStyle24.copyWith(
                              color: ColorManager.texColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50.h),
                  Image.asset(
                    AssetsManager.report,
                    width: double.infinity,
                  ),
                  SizedBox(height: 250.h),
                  SizedBox(
                    width: 250.w,
                    height: 65.h,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.mainColor,
                      ),
                      onPressed: () async {
                        await OpenFile.open(state.report.path);
                      },
                      icon: Icon(
                        Icons.open_in_new,
                        size: 35.sp,
                        color: Colors.white,
                      ),
                      label: Text(
                        'فتح التقرير',
                        style: Styles.textStyle20.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is AdminGetReportFailure) {
              return Text(
                'خطأ: ${state.error}',
                style: Styles.textStyle20.copyWith(
                  color: ColorManager.texColor,
                ),
              );
            } else {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.mainColor,
                ),
                onPressed: () {
                  context.read<AdminGetReportCubit>().getReport(
                      token: PrefsHelper.getToken(key: PrefsKey.token));
                },
                child: Text(
                  'تحميل التقرير',
                  style: Styles.textStyle20.copyWith(
                    color: Colors.white,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  String _getProgressText(double? progress) {
    if (progress == null) return 'جاري التحميل...';
    final percent = (progress.clamp(0.0, 1.0) * 100).toStringAsFixed(0);
    return '$percent%';
  }
}
