import 'zikr.dart';

/// فئة أذكار (الصباح، المساء، النوم، المسجد).
class AzkarCategory {
  const AzkarCategory({
    required this.id,
    required this.title,
    required this.iconPath,
    required this.azkar,
  });

  final String id;
  final String title;
  final String iconPath;
  final List<Zikr> azkar;
}
