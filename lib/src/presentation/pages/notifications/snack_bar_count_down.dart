import 'dart:async';

import 'package:flutter/material.dart';

class SnackBarCountdown extends StatefulWidget {
  final int duration;
  final VoidCallback onUndo;
  final VoidCallback onComplete;

  const SnackBarCountdown({
    Key? key,
    required this.duration,
    required this.onUndo,
    required this.onComplete,
  }) : super(key: key);

  @override
  State<SnackBarCountdown> createState() => _SnackBarWithCountdownState();
}

class _SnackBarWithCountdownState extends State<SnackBarCountdown> {
  late int remainingSeconds;
  Timer? countdownTimer;

  @override
  void initState() {
    super.initState();
    remainingSeconds = widget.duration;
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
      } else {
        timer.cancel();
        widget.onComplete();
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
              width: 30,
              height: 30,
              child: CircularProgressIndicator(
                value: remainingSeconds / widget.duration,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                strokeWidth: 2.0,
              ),
            ),
            Text(
              "$remainingSeconds",
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
        const SizedBox(width: 16),
        const Text("Deleting notification in..."),
      ],
    );
  }
}
