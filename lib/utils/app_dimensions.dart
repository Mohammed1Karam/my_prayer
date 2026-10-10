/// القياسات كما هي في Figma (لوحة 428×926). تُمرَّر على `.s` عند الاستخدام.
class AppDimensions {
  const AppDimensions._();

  // ── عام ─────────────────────────────────────────────────────────────
  /// الهامش الأفقي للشاشة: البطاقات تبدأ عند x=29 والقائمة عند x=25.
  static const double screenPadding = 29;
  static const double headerTop = 54;
  static const double headerIcon = 24;

  // ── شريط التنقل السفلي ──────────────────────────────────────────────
  static const double navBarHeight = 80;
  static const double navIcon = 32;
  static const double navIconAzkar = 45;

  // ── الشاشة الرئيسية ─────────────────────────────────────────────────
  /// بطاقة الصلاة القادمة: 369×174، نصف قطر 10، عند y=118.
  static const double prayerCardWidth = 369;
  static const double prayerCardHeight = 174;
  static const double prayerCardRadius = 10;
  static const double prayerCardTop = 118;

  /// شريط أيام الأسبوع.
  static const double weekStripTop = 313;
  static const double dayCircle = 32.5;
  static const double dayCircleTop = 339;

  /// الخط البنفسجي تحت «وقت الصلاة».
  static const double sectionRuleWidth = 326;
  static const double sectionRuleHeight = 3;

  /// صف الصلاة الواحدة.
  static const double prayerRowWidth = 342;
  static const double prayerRowHeight = 62;
  static const double prayerIcon = 32;

  // ── الأذكار ─────────────────────────────────────────────────────────
  /// بطاقة الفئة: 378×78، نصف قطر 25، والمسافة بين بطاقتين 98.
  static const double azkarCardWidth = 378;
  static const double azkarCardHeight = 78;
  static const double azkarCardRadius = 25;
  static const double azkarCardGap = 20;
  static const double azkarCardTop = 159;
  static const double azkarIcon = 35;

  /// بطاقة الذكر في شاشة التفاصيل.
  static const double zikrCardRadius = 10;

  // ── السبحة ──────────────────────────────────────────────────────────
  static const double sebhaCircle = 229;
  static const double sebhaCircleTop = 391;
  static const double sebhaPatternWidth = 311;
  static const double sebhaPatternHeight = 323;

  // ── القبلة ──────────────────────────────────────────────────────────
  static const double compass = 270;
  static const double compassTop = 353;
  static const double kaaba = 50;
  static const double kaabaTop = 200;

  // ── النقاط ──────────────────────────────────────────────────────────
  static const double dot = 10;
  static const double dotActiveWidth = 25;
  static const double dotRadius = 5;
  static const double dotGap = 5;

  // ── الأوراق ─────────────────────────────────────────────────────────
  static const double sheetRadius = 30;
}
