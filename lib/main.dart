import 'package:flutter/material.dart';
import 'screens/bottom_nav_screen.dart';
void main() {
  runApp(const YumeSproutApp());
}

class YumeSproutApp extends StatelessWidget {
  const YumeSproutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'YumeSprout',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pink,
        ),
      ),
      home: const BottomNavScreen(),
    );
  }
}