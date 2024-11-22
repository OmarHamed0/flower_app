import 'package:flower_app/core/functions/extensions.dart';
import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MainBackButton extends StatelessWidget {
  const MainBackButton({
    super.key,
    this.color = Colors.black,
    this.popWithResult = false,
  });
  final Color color;

  final bool popWithResult;
  @override
  Widget build(BuildContext context) {
    return Navigator.canPop(context)
        ? InkWell(
      onTap: () {
        popWithResult ? context.popWithResult() : context.pop();
      },
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          start: 4.w,
          top: 8.h,
          bottom: 8.h,
          end: 4.w,
        ),
        child: Icon(
          Icons.arrow_back_ios,
          color: AppColors.kBlack,
          size: 22.w,
        ),
      ),
    )
        : const SizedBox();
  }
}
