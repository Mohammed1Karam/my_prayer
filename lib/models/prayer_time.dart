/// صلاة واحدة ضمن قائمة مواقيت اليوم.
class PrayerTime {
  const PrayerTime({
    required this.name,
    required this.time,
    required this.iconPath,
  });

  final String name;
  final DateTime time;
  final String iconPath;

  /// الوقت بصيغة `٤:٣٢ ص` كما في التصميم.
  String get formattedTime {
    final int hour12 = time.hour % 12 == 0 ? 12 : time.hour % 12;
    final String minute = time.minute.toString().padLeft(2, '0');
    final String period = time.hour < 12 ? 'ص' : 'م';
    return '$hour12:$minute $period';
  }
}
