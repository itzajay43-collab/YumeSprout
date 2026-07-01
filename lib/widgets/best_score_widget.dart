import 'package:flutter/material.dart';

class BestScoreWidget extends StatelessWidget {
  final int bestScore;
  final int totalQuestions;

  const BestScoreWidget({
    super.key,
    required this.bestScore,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "🏆 Best Score: $bestScore / $totalQuestions",
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.orange,
      ),
    );
  }
}