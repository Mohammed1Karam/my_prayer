import 'package:flutter/widgets.dart';

/// مقياس يحوّل أبعاد Figma إلى بكسلات منطقية على أي جهاز.
///
/// لوحة التصميم في Figma عرضها 428 وارتفاعها 926 (iPhone 14 Pro Max).
/// كل رقم في الواجهات مكتوب كما هو في Figma ثم يُمرَّر على `.s`.
class AppSizer {
  const AppSizer._();

  static const double designWidth = 428;
  static const double designHeight = 926;

  static double _scale = 1;

  static void init(BuildContext context) {
    _scale = MediaQuery.sizeOf(context).width / designWidth;
  }

  static double scale(double value) => value * _scale;
}

extension FigmaSizeX on num {
  /// الرقم كما هو في Figma، مقيسًا على عرض الجهاز الحالي.
  double get s => AppSizer.scale(toDouble());
}
