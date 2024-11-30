import 'package:flower_app/core/functions/spacing.dart';
import 'package:flower_app/core/styles/icons/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NameAndEmail extends StatelessWidget {
  const NameAndEmail({super.key, required this.name, this.email, this.onEdit});
  final String? name;
  final String? email;
  final void Function()? onEdit;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            horizontalSpace(4),
            InkWell(
              onTap: onEdit,
              child: SvgPicture.asset(
                AppIcons.penIcon,
                width: 24.0.w,
                height: 24.0.h,
              ),
            )
          ],
        ),
        verticalSpace(4),
        Text(
          email!,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
