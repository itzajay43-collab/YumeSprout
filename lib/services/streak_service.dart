import 'package:shared_preferences/shared_preferences.dart';

class StreakService {
  static const String streakKey = "daily_streak";
  static const String bestKey = "best_streak";
  static const String lastOpenKey = "last_open";

  Future<void> updateStreak() async {
    final prefs = await SharedPreferences.getInstance();

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final lastOpen = prefs.getString(lastOpenKey);

    int streak = prefs.getInt(streakKey) ?? 0;
    int best = prefs.getInt(bestKey) ?? 0;

    if (lastOpen == null) {
      streak = 1;
    } else {
      final last = DateTime.parse(lastOpen);
      final difference = today.difference(last).inDays;

      if (difference == 1) {
        streak++;
      } else if (difference > 1) {
        streak = 1;
      }
    }

    if (streak > best) {
      best = streak;
    }

    await prefs.setInt(streakKey, streak);
    await prefs.setInt(bestKey, best);
    await prefs.setString(lastOpenKey, today.toIso8601String());
  }

  Future<int> getStreak() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(streakKey) ?? 1;
  }

  Future<int> getBestStreak() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(bestKey) ?? 1;
  }
}