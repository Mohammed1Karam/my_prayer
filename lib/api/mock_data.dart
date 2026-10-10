import '../models/azkar_category.dart';
import '../models/hijri_date.dart';
import '../models/onboarding_page_model.dart';
import '../models/prayer_time.dart';
import '../models/zikr.dart';
import '../utils/app_assets.dart';
import '../utils/app_colors.dart';

 class MockData {
  const MockData._();

  // ── شاشات التعريف ───────────────────────────────────────────────────
  static const List<OnboardingPageModel> onboardingPages =
      <OnboardingPageModel>[
    OnboardingPageModel(
      imagePath: AppAssets.onboardingQuran,
      title: '" وَسَبِّحُوهُ بُكرَةً وَأَصِيلً "',
      description: 'تطبيق صلاتي  سوف يساعدك أينما كنت كي \n لا تنسي ذكر الله',
      dotColor: AppColors.dotGreen,
      imageStart: -139,
      imageTop: 121,
      imageWidth: 691,
      imageHeight: 442,
      textTop: 563,
      textWidth: 307,
    ),
    OnboardingPageModel(
      imagePath: AppAssets.onboardingFamily,
      title:
          '" وَمَا تُقَدِّمُوا لِأَنْفُسِكم مِنْ خَيرٍ\nتَجِدُوهُ عِنْدَ اللَّهِ هُوَ خَيْرًا وَأَعْظَمَ\nأَجْرًا "',
      description: 'تطبيق صلاتي سوف يساعدك علي\nتذكر مواعيد الصلاة',
      dotColor: AppColors.orchid,
      imageStart: 14,
      imageTop: 202,
      imageWidth: 400,
      imageHeight: 300,
      textTop: 562,
      textWidth: 318,
    ),
    OnboardingPageModel(
      imagePath: AppAssets.onboardingQibla,
      title: 'القبلة',
      description:
          'تطبيق صلاتي سوف يساعدك في البحث عن\nاتجاه القبلة من موقعك الحالي',
      dotColor: AppColors.orchid,
      imageStart: 14,
      imageTop: 204,
      imageWidth: 400,
      imageHeight: 300,
      textTop: 562,
      textWidth: 318,
    ),
  ];

  // ── التاريخ ─────────────────────────────────────────────────────────
  static HijriDate get today => HijriDate(
        day: 6,
        monthName: 'ربيع الاخير',
        year: 1444,
        gregorian: DateTime(2022, 11, 20),
      );

  static const List<String> weekDayNames = <String>[
    'السبت',
    'الاحد',
    'الاثنين',
    'الثلاثاء',
    'الاربعاء',
    'الخميس',
    'الجمعة',
  ];

  // ── مواقيت الصلاة ───────────────────────────────────────────────────
  static List<PrayerTime> get prayerTimes => <PrayerTime>[
        PrayerTime(
          name: 'صلاة الفجر',
          time: DateTime(2022, 11, 20, 4, 32),
          iconPath: AppAssets.prayerFajr,
        ),
        PrayerTime(
          name: 'صلاة الشروق',
          time: DateTime(2022, 11, 20, 6, 8),
          iconPath: AppAssets.prayerSunrise,
        ),
        PrayerTime(
          name: 'صلاة الظهر',
          time: DateTime(2022, 11, 20, 11, 28),
          iconPath: AppAssets.prayerDhuhr,
        ),
        PrayerTime(
          name: 'صلاة العصر',
          time: DateTime(2022, 11, 20, 14, 21),
          iconPath: AppAssets.prayerAsr,
        ),
        PrayerTime(
          name: 'صلاة المغرب',
          time: DateTime(2022, 11, 20, 16, 32),
          iconPath: AppAssets.prayerMaghrib,
        ),
        PrayerTime(
          name: 'صلاة العشاء',
          time: DateTime(2022, 11, 20, 18, 2),
          iconPath: AppAssets.prayerIsha,
        ),
      ];

  // ── الأذكار ─────────────────────────────────────────────────────────
  static const List<AzkarCategory> azkarCategories = <AzkarCategory>[
    AzkarCategory(
      id: 'morning',
      title: 'أذكار الصباح',
      iconPath: AppAssets.azkarMorning,
      azkar: <Zikr>[
        Zikr(
          text:
              'بِسْمِ اللهِ الَّذي لا يَضُرُّ مَعَ اسمِهِ شَيءٌ في الأَرْضِ وَلا في السَّماءِ وَهوَ السَّميعُ العَليمُ.',
          repeat: 3,
        ),
        Zikr(
          text:
              'اللَّهُمَّ ما أَصْبَحَ بي مِنْ نِعْمَةٍ أَوْ بِأَحَدٍ مِنْ خَلْقِكَ ، فَمِنكَ وَحْدَكَ لا شريكَ لَكَ ، فَلَكَ الْحَمْدُ وَلَكَ الشكر',
          repeat: 2,
        ),
        Zikr(
          text:
              'بِسْمِ اللهِ الَّذي لا يَضُرُّ مَعَ اسمِهِ شَيءٌ في الأَرْضِ وَلا في السَّماءِ وَهوَ السَّميعُ العَليمُ.',
          repeat: 2,
        ),
      ],
    ),
    AzkarCategory(
      id: 'evening',
      title: 'أذكار المساء',
      iconPath: AppAssets.azkarEvening,
      azkar: <Zikr>[
        Zikr(
          text:
              'أَمْسَيْنا وَأَمْسَى الْمُلْكُ لِلَّهِ وَالْحَمْدُ لِلَّهِ ، لا إِلَهَ إِلاَّ اللَّهُ وَحْدَهُ لا شَريكَ لَهُ.',
          repeat: 1,
        ),
      ],
    ),
    AzkarCategory(
      id: 'sleep',
      title: 'أذكار النوم',
      iconPath: AppAssets.azkarSleep,
      azkar: <Zikr>[
        Zikr(
          text: 'بِاسْمِكَ اللَّهُمَّ أَمُوتُ وَأَحْيَا.',
          repeat: 1,
        ),
      ],
    ),
    AzkarCategory(
      id: 'mosque',
      title: 'أذكار المسجد',
      iconPath: AppAssets.azkarMosque,
      azkar: <Zikr>[
        Zikr(
          text: 'اللَّهُمَّ افْتَحْ لِي أَبْوَابَ رَحْمَتِكَ.',
          repeat: 1,
        ),
      ],
    ),
  ];

  // ── السبحة ──────────────────────────────────────────────────────────
  static const List<String> tasbeehPhrases = <String>[
    'أستغفر الله  الذي لا إله إلا هو\nالحي القيوم',
    'سُبْحَانَ اللهِ وَبِحَمْدِهِ',
    'لا إله إلا الله وحده لا شريك له',
    'اللَّهُمَّ صَلِّ وَسَلِّمْ عَلَى نَبِيِّنَا مُحَمَّدٍ',
    'لا حول ولا قوة إلا بالله',
    'الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ',
  ];

  // ── القائمة الجانبية ────────────────────────────────────────────────
  static const List<({String title, String iconPath})> menuItems =
      <({String title, String iconPath})>[
    (title: 'غزة', iconPath: AppAssets.menuLocation),
    (title: 'اللغة', iconPath: AppAssets.menuLanguage),
    (title: 'عن التطبيق', iconPath: AppAssets.menuAbout),
    (title: 'تواصل معنا', iconPath: AppAssets.menuWhatsapp),
  ];
}
