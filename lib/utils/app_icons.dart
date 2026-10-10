import 'package:flutter/material.dart';

/// أيقونات الاتجاه مسمّاة بدورها لا بجهتها.
///
/// أيقونات ماتيريال الاتجاهية معرَّفة بـ `matchTextDirection: true`، أي أنها
/// تنعكس تلقائيًا داخل واجهة RTL: [Icons.arrow_back] يشير إلى اليمين،
/// و[Icons.chevron_right] يشير إلى اليسار. لذلك لا يجوز اختيارها بالنظر إلى
/// اسمها، بل بالنظر إلى معناها — وهذا ما توفّره الأسماء أدناه.
class AppIcons {
  const AppIcons._();

  /// سهم الرجوع — يشير إلى جهة البداية (اليمين في العربية).
  static const IconData back = Icons.arrow_back_rounded;

  /// سهم التقدّم — يشير إلى جهة النهاية (اليسار في العربية).
  static const IconData forward = Icons.arrow_forward_rounded;

  /// سهم صغير للعنصر السابق — يشير إلى جهة البداية (اليمين في العربية).
  static const IconData chevronBack = Icons.chevron_left;

  /// سهم صغير للعنصر التالي أو لفتح عنصر في قائمة —
  /// يشير إلى جهة النهاية (اليسار في العربية).
  static const IconData chevronForward = Icons.chevron_right;
}
