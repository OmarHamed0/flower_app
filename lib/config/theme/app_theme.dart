import 'package:flower_app/common/common.dart';
import 'package:flower_app/core/styles/colors/app_colors.dart';

import '../../core/styles/texts/app_text_styles.dart';

class AppTheme {
  AppTheme._();


  static ThemeData defaultTheme =
  ThemeData(scaffoldBackgroundColor: AppColors.kWhiteBase,
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.transparent
  ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 48),
          backgroundColor: AppColors.kBaseColor,
          disabledBackgroundColor: AppColors.kWhite70,
          textStyle: AppTextStyles.font14BlackBase500Weight.copyWith(color: AppColors.kWhiteBase)),
    ),
  );


}
