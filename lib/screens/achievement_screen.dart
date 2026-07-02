import 'package:flutter/material.dart';
import '../services/achievement_service.dart';

class AchievementScreen extends StatelessWidget {
  const AchievementScreen({super.key});

  Future<bool> firstAchievement() async {
    return AchievementService().isUnlocked(
      AchievementService.firstCharacterKey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Achievements"),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xFFFFF5F8),

      body: FutureBuilder<bool>(
        future: firstAchievement(),
        builder: (context, snapshot) {
          final unlocked = snapshot.data ?? false;

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: ListTile(
                  leading: Text(
                    unlocked ? "🏅" : "🔒",
                    style: const TextStyle(fontSize: 30),
                  ),
                  title: const Text(
                    "First Character",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    unlocked
                        ? "Unlocked"
                        : "Learn your first character",
                  ),
                  trailing: Icon(
                    unlocked
                        ? Icons.check_circle
                        : Icons.lock,
                    color: unlocked
                        ? Colors.green
                        : Colors.grey,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}