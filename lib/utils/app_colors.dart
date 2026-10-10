import 'package:flutter/material.dart';

/// ألوان التطبيق — مستخرجة حرفيًا من ملف Figma (`fills` لكل عنصر).
class AppColors {
  const AppColors._();

  // ── البنفسجي ────────────────────────────────────────────────────────
  /// خلفية شاشة البداية، بداية تدرّج البطاقة، والأيقونة النشطة في الشريط.
  static const Color lilac = Color(0xFFDF98FA);

  /// نهاية تدرّج بطاقة الصلاة القادمة.
  static const Color violet = Color(0xFF9055FF);

  /// دائرة اليوم المختار والخط الفاصل تحت «وقت الصلاة».
  static const Color primary = Color(0xFFA96AFE);

  /// دائرة السبحة الكبيرة والنقطة النشطة.
  static const Color orchid = Color(0xFFCF8AFB);

  /// تدرّج بطاقة الصلاة القادمة — قطريًّا من زاوية البداية العليا
  /// إلى زاوية النهاية السفلى، فينعكس مع اتجاه الواجهة.
  static const List<Color> prayerCardGradient = <Color>[lilac, violet];

  // ── الأسطح ──────────────────────────────────────────────────────────
  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFFFFFFF);

  /// خلفية بطاقة الذكر في شاشة تفاصيل الأذكار.
  static const Color zikrCard = Color(0x0D863ED5);

  /// الطبقة الرمادية خلف القائمة الجانبية.
  static const Color scrim = Color(0x4D858383);

  // ── النصوص ──────────────────────────────────────────────────────────
  static const Color textBlack = Color(0xFF000000);
  static const Color textHeader = Color(0xFF494949);
  static const Color textMuted = Color(0xFF737373);
  static const Color textBody = Color(0xFF666363);
  static const Color textQibla = Color(0xFF626262);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // ── مساعدة ──────────────────────────────────────────────────────────
  static const Color divider = Color(0x59BBC4CE);
  static const Color dotInactive = Color(0xFFD9D9D9);
  static const Color dotSemi = Color(0xFFE9CFE4);
  static const Color dotGreen = Color(0xFF4AD190);
  static const Color navIcon = Color(0xFF737373);

  // ── الظلال ──────────────────────────────────────────────────────────
  /// ظل شريط التنقل السفلي: ‎#BAB0CE @20%‎ blur 16 y ‎-4‎.
  static const List<BoxShadow> navBarShadow = <BoxShadow>[
    BoxShadow(color: Color(0x33BAB0CE), blurRadius: 16, offset: Offset(0, -4)),
  ];

  /// ظل بطاقة فئة الأذكار: أسود ‎@10%‎ blur 4 y 4.
  static const List<BoxShadow> azkarCardShadow = <BoxShadow>[
    BoxShadow(color: Color(0x1A000000), blurRadius: 4, offset: Offset(0, 4)),
  ];

  /// ظل بطاقة الذكر: أسود ‎@5%‎ blur 50 y 20.
  static const List<BoxShadow> zikrCardShadow = <BoxShadow>[
    BoxShadow(color: Color(0x0D000000), blurRadius: 50, offset: Offset(0, 20)),
  ];

  /// ظل دائرة السبحة: أسود ‎@25%‎ blur 4 y 4.
  static const List<BoxShadow> sebhaShadow = <BoxShadow>[
    BoxShadow(color: Color(0x40000000), blurRadius: 4, offset: Offset(0, 4)),
  ];
}
