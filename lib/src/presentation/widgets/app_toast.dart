import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String message) {
  Fluttertoast.showToast(
    msg: message ?? "An error occurred",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: AppColors.kError,
    textColor: AppColors.kWhiteBase,
    fontSize: 16.0,
  );
}
