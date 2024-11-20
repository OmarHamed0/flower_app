import 'package:flower_app/core/functions/spacing.dart';
import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/core/styles/fonts/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderSelection extends StatefulWidget {
  const GenderSelection({Key? key}) : super(key: key);

  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  String selectedGender = 'female';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Row(
        children: [
          Text(
            'Gender',
          ),
          horizontalSpace(20),
          Row(
            children: [
              Radio<String>(
                value: 'female',
                groupValue: selectedGender,
                // activeColor: AppColors.mainColor,
                onChanged: (value) {
                  setState(() {
                    selectedGender = value!;
                  });
                },
              ),
              Text(
                'female',
                style: AppFonts.font14BlackBase400Weight,
              ),
            ],
          ),
          horizontalSpace(10),
          Row(
            children: [
              Radio<String>(
                value: 'male',
                groupValue: selectedGender,
                activeColor: AppColors.mainColor,
                onChanged: (value) {
                  setState(() {
                    selectedGender = value!;
                  });
                },
              ),
              Text(
                'male',
                style: AppFonts.font14BlackBase400Weight,
              ),
            ],
          ),
        ],
      ),
    );
  }
}