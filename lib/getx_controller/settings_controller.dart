import 'dart:ui';

import 'package:get/get.dart';

import '../preferences/app_preferences.dart';

/// المدينة واللغة المعروضتان في القائمة الجانبية.
class SettingsController extends GetxController {
  final RxString city = ''.obs;
  final RxString languageCode = 'ar'.obs;

  @override
  void onInit() {
    super.onInit();
    city.value = AppPreferences.instance.city;
    languageCode.value = AppPreferences.instance.languageCode;
  }

  Future<void> changeCity(String value) async {
    city.value = value;
    await AppPreferences.instance.setCity(value);
  }

  Future<void> changeLanguage(String code) async {
    languageCode.value = code;
    await AppPreferences.instance.setLanguageCode(code);
    Get.updateLocale(Locale(code));
  }
}
