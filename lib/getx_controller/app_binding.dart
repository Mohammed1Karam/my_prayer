import 'package:get/get.dart';

import 'azkar_controller.dart';
import 'nav_controller.dart';
import 'prayer_times_controller.dart';
import 'qibla_controller.dart';
import 'sebha_controller.dart';
import 'settings_controller.dart';

/// تسجيل المتحكمات المشتركة عند إقلاع التطبيق.
class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavController>(NavController.new, fenix: true);
    Get.lazyPut<PrayerTimesController>(PrayerTimesController.new, fenix: true);
    Get.lazyPut<AzkarController>(AzkarController.new, fenix: true);
    Get.lazyPut<SebhaController>(SebhaController.new, fenix: true);
    Get.lazyPut<QiblaController>(QiblaController.new, fenix: true);
    Get.lazyPut<SettingsController>(SettingsController.new, fenix: true);
  }
}
