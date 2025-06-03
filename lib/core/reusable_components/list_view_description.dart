import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkify_app/core/utils/color_manager.dart';
import 'package:linkify_app/core/utils/styles_manager.dart';

class ListViewDescription extends StatelessWidget {
  const ListViewDescription({super.key, required this.listViewName});

  final String listViewName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17.w),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          listViewName,
          style: Styles.textStyle20.copyWith(color: ColorManager.texColor),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}
