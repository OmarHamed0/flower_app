import 'package:flower_app/common/common.dart';
import 'package:flower_app/core/styles/colors/app_colors.dart';

class AppTheme {
  AppTheme._();


  static ThemeData defaultTheme =
  ThemeData(scaffoldBackgroundColor: AppColors.kWhiteBase,
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.transparent
  )

  );


}
