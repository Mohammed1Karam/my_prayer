import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'getx_controller/app_binding.dart';
import 'preferences/app_preferences.dart';
import 'utils/app_routes.dart';
import 'utils/app_sizer.dart';
import 'utils/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreferences.init();
  runApp(const MyPrayerApp());
}

class MyPrayerApp extends StatelessWidget {
  const MyPrayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'صلاتي',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialBinding: AppBinding(),
      // يمكن فتح شاشة بعينها أثناء التطوير عبر:
      // flutter run --dart-define=INITIAL_ROUTE=/home
      initialRoute: const String.fromEnvironment(
        'INITIAL_ROUTE',
        defaultValue: AppRoutes.splash,
      ),
      getPages: AppRoutes.pages,
      locale: const Locale('ar'),
      fallbackLocale: const Locale('ar'),
      supportedLocales: const <Locale>[Locale('ar'), Locale('en')],
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      builder: (BuildContext context, Widget? child) {
        // يضبط معامل التحويل من لوحة Figma (428) إلى عرض الجهاز الحالي.
        AppSizer.init(context);
        // اتجاه الواجهة يُشتقّ من لغتها لا يُثبَّت: العربية RTL، وأي لغة
        // تُضاف لاحقًا تأخذ اتجاهها الصحيح دون تعديل الشاشات، لأن كل
        // الشاشات مبنية بمواضع اتجاهية (start/end) لا بيمين ويسار ثابتين.
        final Locale locale = Localizations.localeOf(context);
        return Directionality(
          textDirection: _directionOf(locale),
          child: MediaQuery.withNoTextScaling(
            child: child ?? const SizedBox.shrink(),
          ),
        );
      },
    );
  }
}

/// اتجاه الكتابة المقابل للغة الواجهة.
TextDirection _directionOf(Locale locale) {
  const Set<String> rtlLanguages = <String>{'ar', 'fa', 'he', 'ur'};
  return rtlLanguages.contains(locale.languageCode)
      ? TextDirection.rtl
      : TextDirection.ltr;
}
