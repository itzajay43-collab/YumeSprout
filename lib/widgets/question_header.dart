import 'package:flutter/material.dart';

class QuestionHeader extends StatelessWidget {
  final int currentQuestion;
  final int totalQuestions;

  const QuestionHeader({
    super.key,
    required this.currentQuestion,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Question ${currentQuestion + 1} / $totalQuestions",
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}