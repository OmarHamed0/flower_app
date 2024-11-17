import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../managers/sign_in/sign_in_states.dart';

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