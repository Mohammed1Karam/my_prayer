import 'package:flutter/material.dart';

import '../utils/app_assets.dart';
import '../utils/app_dimensions.dart';
import '../utils/app_sizer.dart';

/// بوصلة القبلة — الرسمة المصدَّرة من Figma بقطر 270.
///
/// الصورة تتضمّن الإبرة عند زاوية التصميم (١٢٠°) فتُعرض دون تدوير حتى
/// تطابق Figma تمامًا. لجعلها حيّة لاحقًا: صدّر الحلقة (‎799:2077‎ بدون
/// ‎799:2089‎ و‎799:2090‎) والإبرة كلًّا على حدة، ثم دوّر الإبرة بـ [angle].
class QiblaCompass extends StatelessWidget {
  const QiblaCompass({super.key, required this.angle});

  /// زاوية القبلة بالدرجات — ستُستعمل عند فصل الإبرة عن الحلقة.
  final double angle;

  @override
  Widget build(BuildContext context) {
    final double side = AppDimensions.compass.s;
    return Image.asset(
      AppAssets.compass,
      width: side,
      height: side,
      fit: BoxFit.contain,
      errorBuilder: (_, _, _) => SizedBox.square(dimension: side),
    );
  }
}
