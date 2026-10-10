import 'package:get/get.dart';

import '../api/mock_data.dart';
import '../models/hijri_date.dart';
import '../models/prayer_time.dart';

/// مواقيت اليوم، الصلاة القادمة، واليوم المختار في شريط الأيام.
class PrayerTimesController extends GetxController {
  final RxList<PrayerTime> prayerTimes = <PrayerTime>[].obs;
  final Rx<HijriDate> date = MockData.today.obs;
  final RxInt selectedDayIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    prayerTimes.assignAll(MockData.prayerTimes);
  }

  List<String> get weekDayNames => MockData.weekDayNames;

  /// أرقام أيام الأسبوع المعروضة تحت أسماء الأيام.
  ///
  /// الترتيب تصاعدي ليطابق [weekDayNames] (السبت ← الجمعة)؛ الصف يتبع اتجاه
  /// الواجهة فيظهر السبت في أقصى اليمين والتاريخ يتقدّم يسارًا.
  List<int> get weekDayNumbers => <int>[2, 3, 4, 5, 6, 7, 8];

  void selectDay(int index) => selectedDayIndex.value = index;

  /// أول صلاة لم يحن وقتها بعد، وإلا فأولى صلوات الغد.
  PrayerTime get nextPrayer {
    final DateTime now = DateTime.now();
    return prayerTimes.firstWhere(
      (PrayerTime prayer) => prayer.time.isAfter(now),
      orElse: () => prayerTimes.first,
    );
  }

  bool isCurrent(PrayerTime prayer) => prayer.name == nextPrayer.name;
}
