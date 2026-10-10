import 'package:shared_preferences/shared_preferences.dart';

/// غلاف حول SharedPreferences حتى لا تتسرّب المفاتيح النصية إلى بقية الكود.
class AppPreferences {
  AppPreferences._(this._prefs);

  static AppPreferences? _instance;
  final SharedPreferences _prefs;

  static AppPreferences get instance {
    final AppPreferences? value = _instance;
    if (value == null) {
      throw StateError('استدعِ AppPreferences.init() قبل الاستخدام');
    }
    return value;
  }

  static Future<AppPreferences> init() async {
    _instance ??= AppPreferences._(await SharedPreferences.getInstance());
    return _instance!;
  }

  // ── المفاتيح ────────────────────────────────────────────────────────
  static const String _kOnboardingSeen = 'onboarding_seen';
  static const String _kTasbeehCount = 'tasbeeh_count';
  static const String _kLanguageCode = 'language_code';
  static const String _kCity = 'city';

  // ── شاشات التعريف ───────────────────────────────────────────────────
  bool get onboardingSeen => _prefs.getBool(_kOnboardingSeen) ?? false;
  Future<void> setOnboardingSeen(bool value) =>
      _prefs.setBool(_kOnboardingSeen, value);

  // ── السبحة ──────────────────────────────────────────────────────────
  int get tasbeehCount => _prefs.getInt(_kTasbeehCount) ?? 0;
  Future<void> setTasbeehCount(int value) =>
      _prefs.setInt(_kTasbeehCount, value);

  // ── الإعدادات ───────────────────────────────────────────────────────
  String get languageCode => _prefs.getString(_kLanguageCode) ?? 'ar';
  Future<void> setLanguageCode(String value) =>
      _prefs.setString(_kLanguageCode, value);

  String get city => _prefs.getString(_kCity) ?? 'غزة';
  Future<void> setCity(String value) => _prefs.setString(_kCity, value);
}
