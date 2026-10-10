/// تاريخ هجري مع مقابله الميلادي، كما يظهر في الترويسة والتقويم.
class HijriDate {
  const HijriDate({
    required this.day,
    required this.monthName,
    required this.year,
    required this.gregorian,
  });

  final int day;
  final String monthName;
  final int year;
  final DateTime gregorian;

  /// مثال: `٦ ربيع الاخير ١٤٤٤`
  String get formatted => '$day $monthName $year';
}
