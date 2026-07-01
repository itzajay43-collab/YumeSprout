import 'dart:async';
import 'package:flutter/material.dart';
import '../services/quiz_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestion = 0;
  int score = 0;
  int bestScore = 0;

  int timeLeft = 10;
  Timer? timer;

  late List<QuizQuestion> questions;

  String selectedAnswer = "";
  bool answered = false;

  @override
void initState() {
  super.initState();
  questions = getRandomQuiz();
  loadBestScore();
  startTimer();
}

  void checkAnswer(String answer) {
    if (answered) return;

    setState(() {
      selectedAnswer = answer;
      answered = true;

      if (answer == questions[currentQuestion].answer) {
        score++;
      }
    });
  }

  void nextQuestion() {
    if (currentQuestion < questions.length - 1) {
      setState(() {
  currentQuestion++;
  answered = false;
  selectedAnswer = "";
});

startTimer();
    } else {
      saveBestScore();
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("🎉 Quiz Finished"),
          content: Text(
            "Your Score: $score / ${questions.length}",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);

                setState(() {
                  questions = getRandomQuiz(); // New random quiz
                  currentQuestion = 0;
                  score = 0;
                  answered = false;
                  selectedAnswer = "";
                });
                startTimer();
              },
              child: const Text("Restart"),
            ),
          ],
        ),
      );
    }
  }
  Future<void> loadBestScore() async {
  final prefs = await SharedPreferences.getInstance();

  setState(() {
    bestScore = prefs.getInt("bestScore") ?? 0;
  });
}

Future<void> saveBestScore() async {
  final prefs = await SharedPreferences.getInstance();

  if (score > bestScore) {
    bestScore = score;
    await prefs.setInt("bestScore", score);
  }
}
void startTimer() {
  timer?.cancel();

  timeLeft = 10;

  timer = Timer.periodic(
    const Duration(seconds: 1),
    (t) {
      if (!mounted) {
        t.cancel();
        return;
      }

      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
        });
      } else {
        t.cancel();

        if (!answered) {
          checkAnswer("");
        }

        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            nextQuestion();
          }
        });
      }
    },
  );
}

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];

    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        title: const Text("📝 Quiz"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            Text(
              "Question ${currentQuestion + 1} / ${questions.length}",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
  "🏆 Best Score: $bestScore / ${questions.length}",
  style: const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.orange,
  ),
),

const SizedBox(height: 10),

Text(
  "⏱ Time Left: $timeLeft",
  style: const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.red,
  ),
),

const SizedBox(height: 15),
            const SizedBox(height: 30),

            Text(
              question.question,
              style: const TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 40),

            ...question.options.map(
              (option) => Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: answered
                        ? null
                        : () => checkAnswer(option),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        option,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            if (answered)
              Text(
                selectedAnswer == question.answer
                    ? "🎉 Correct!"
                    : "❌ Wrong! Correct Answer: ${question.answer}",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: selectedAnswer == question.answer
                      ? Colors.green
                      : Colors.red,
                ),
              ),

            const SizedBox(height: 20),

            if (answered)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: nextQuestion,
                  child: const Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Next Question",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}