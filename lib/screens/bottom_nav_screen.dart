import 'settings_screen.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'learn_screen.dart';
import 'quiz_screen.dart';
import 'profile_screen.dart';
import 'home_screen_v2.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int currentIndex = 0;

  final List<Widget> screens = [
    HomeScreenV2(),
    LearnScreen(),
    QuizScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[currentIndex],

      bottomNavigationBar: SafeArea(
  child: Padding(
    padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: BottomNavigationBar(
        currentIndex: currentIndex,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        type: BottomNavigationBarType.fixed,

        backgroundColor: Colors.white,

        elevation: 12,

        selectedItemColor: Colors.pink,

        unselectedItemColor: Colors.grey,

        selectedFontSize: 12,

        unselectedFontSize: 12,

        showUnselectedLabels: true,

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.school_rounded),
            label: "Learn",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.quiz_rounded),
            label: "Quiz",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: "Profile",
          ),
        ],
      ),
    ),
  ),
),
    );
  }
}