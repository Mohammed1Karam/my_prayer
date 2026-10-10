import 'dart:ui';

/// صفحة تعريف واحدة مع هندستها الدقيقة كما في Figma (لوحة 428×926).
///
/// [imageStart] مقاس من حافة البداية — اليمين في الواجهة العربية — فتنعكس
/// الرسمة مع اتجاه الواجهة بدل أن تبقى معلّقة بحافة ثابتة.
class OnboardingPageModel {
  const OnboardingPageModel({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.dotColor,
    required this.imageStart,
    required this.imageTop,
    required this.imageWidth,
    required this.imageHeight,
    required this.textTop,
    required this.textWidth,
  });

  final String imagePath;
  final String title;
  final String description;

  /// لون النقطة النشطة — أخضر في الشاشة الأولى وبنفسجي في الباقي.
  final Color dotColor;

  // هندسة الرسمة كما في Figma.
  final double imageStart;
  final double imageTop;
  final double imageWidth;
  final double imageHeight;

  // هندسة كتلة النص.
  final double textTop;
  final double textWidth;
}
