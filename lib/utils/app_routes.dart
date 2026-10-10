import 'package:get/get.dart';

import '../screen/azkar/azkar_details_screen.dart';
import '../screen/bottom_nav_bar/bottom_nav_screen.dart';
import '../screen/calendar/calendar_screen.dart';
import '../screen/onboarding/onboarding_screen.dart';
import '../screen/setting/menu_screen.dart';
import '../screen/splash/splash_screen.dart';
import 'app_transitions.dart';

/// أسماء المسارات وخريطة صفحات GetX.
class AppRoutes {
  const AppRoutes._();

  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String home = '/home';
  static const String azkarDetails = '/azkar-details';
  static const String calendar = '/calendar';
  static const String menu = '/menu';

  static final List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
    GetPage<dynamic>(name: splash, page: () => const SplashScreen()),
    GetPage<dynamic>(name: onboarding, page: () => const OnboardingScreen()),
    GetPage<dynamic>(name: home, page: () => const BottomNavScreen()),
    GetPage<dynamic>(
      name: azkarDetails,
      page: () => const AzkarDetailsScreen(),
    ),
    GetPage<dynamic>(name: calendar, page: () => const CalendarScreen()),
    // القائمة الجانبية تنزلق من حافة البداية التي تلتصق بها،
    // أي من اليمين في الواجهة العربية، وتبقى الشاشة السابقة ظاهرة خلفها.
    GetPage<dynamic>(
      name: menu,
      page: () => const MenuScreen(),
      opaque: false,
      customTransition: StartEdgeSlideTransition(),
      transitionDuration: const Duration(milliseconds: 280),
    ),
  ];
}
