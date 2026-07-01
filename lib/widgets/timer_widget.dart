import 'package:flutter/material.dart';

class TimerWidget extends StatelessWidget {
  final int timeLeft;

  const TimerWidget({
    super.key,
    required this.timeLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "⏱ Time Left: $timeLeft",
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.red,
      ),
    );
  }
}