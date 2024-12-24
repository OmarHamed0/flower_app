import 'dart:async';
import 'dart:developer';

import 'package:flower_app/common/common.dart';
import 'package:flower_app/core/functions/spacing.dart';

class SnackBarCountdown extends StatefulWidget {
  final int duration;
  final VoidCallback onUndo;
  final VoidCallback onComplete;

  const SnackBarCountdown({
    super.key,
    required this.duration,
    required this.onUndo,
    required this.onComplete,
  });

  @override
  State<SnackBarCountdown> createState() => _SnackBarWithCountdownState();
}

class _SnackBarWithCountdownState extends State<SnackBarCountdown> {
   int remainingSeconds = 5;
  Timer? countdownTimer;

  @override
  void initState() {
    super.initState();
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
        if(remainingSeconds == 0) {
          widget.onComplete();
        }
      }
      else {
        log("Countdown finished, executing onComplete");
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 30.w,
              height: 30.h,
              child: CircularProgressIndicator(
                value: remainingSeconds / widget.duration,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                strokeWidth: 2.0.w,
              ),
            ),
            Text(
              "$remainingSeconds",
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
        horizontalSpace(16),
        const Text("Deleting notification in..."),
      ],
    );
  }
}
