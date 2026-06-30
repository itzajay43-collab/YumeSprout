import 'dart:async';
import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            AnimatedScale(
  scale: 1.2,
  duration: Duration(seconds: 2),
  child: Text(
    "🌸",
    style: TextStyle(fontSize: 90),
  ),
),

            SizedBox(height: 20),

            Text(
              "YumeSprout",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            Text(
              "Learn Japanese with Fun",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),

            SizedBox(height: 40),

            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}