import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../core/styles/images/app_images.dart';

class StateMessageWidget extends StatelessWidget {
  final String text;
  final String errorMassage;
  final void Function()? onPressed;
  final String? imageUrl;
  const StateMessageWidget(
      {super.key,
      required this.text,
      required this.errorMassage,
      this.onPressed,
      this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(imageUrl == null ? AppImages.errorImage : imageUrl!,
              height: 200.h),
          Text(
              textAlign: TextAlign.center,
              errorMassage,
              style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w600)),
          SizedBox(
            height: 14.h,
          ),
          SizedBox(
            width: 200.w,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigoAccent,
                    shape: const RoundedRectangleBorder()),
                onPressed: onPressed,
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                )),
          )
        ],
      ),
    );
  }
}
