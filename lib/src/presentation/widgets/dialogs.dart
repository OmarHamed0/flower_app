import 'package:flower_app/core/animations/app_animation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      // Prevent dismissing the dialog by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Rounded corners
          ),
          content: Lottie.asset(
            AppAnimations.loading,
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }

  static void hide(BuildContext context) {
    // Pop the dialog if it is still displayed
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }
}

class SuccessDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      // Prevent dismissing the dialog by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Rounded corners
          ),
          content: Lottie.asset(
            AppAnimations.success,
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }

  static void hide(BuildContext context) {
    // Pop the dialog if it is still displayed
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }
}

class ErrorDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      // Prevent dismissing the dialog by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Rounded corners
          ),
          content: Lottie.asset(
            AppAnimations.error,
            width: 300,
            height: 300,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }

  static void hide(BuildContext context) {
    // Pop the dialog if it is still displayed
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }
}
