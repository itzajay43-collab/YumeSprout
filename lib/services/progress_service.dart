import 'package:shared_preferences/shared_preferences.dart';

class ProgressService {
  static const String hiraganaKey = "hiraganaProgress";
  static const String katakanaKey = "katakanaProgress";

  static const String lastHiragana = "lastHiragana";
  static const String lastKatakana = "lastKatakana";

  Future<void> saveHiraganaProgress(int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(hiraganaKey, value);
  }

  Future<void> saveKatakanaProgress(int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(katakanaKey, value);
  }

  Future<int> getHiraganaProgress() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(hiraganaKey) ?? 0;
  }

  Future<int> getKatakanaProgress() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(katakanaKey) ?? 0;
  }

  Future<void> saveLastHiragana(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(lastHiragana, value);
  }

  Future<void> saveLastKatakana(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(lastKatakana, value);
  }

  Future<String> getLastHiragana() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(lastHiragana) ?? "あ";
  }

  Future<String> getLastKatakana() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(lastKatakana) ?? "ア";
  }
}