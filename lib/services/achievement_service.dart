import 'package:shared_preferences/shared_preferences.dart';

class AchievementService {
  static const String firstCharacterKey = "achievement_first_character";
  static const String hundredXPKey = "achievement_100_xp";
  static const String streak7Key = "achievement_7_day_streak";

  Future<void> unlock(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, true);
  }

  Future<bool> isUnlocked(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }
}