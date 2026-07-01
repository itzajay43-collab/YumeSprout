import 'package:flutter/material.dart';

class QuizOptionButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const QuizOptionButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              text,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}