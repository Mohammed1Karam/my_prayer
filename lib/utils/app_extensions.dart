import 'package:flutter/material.dart';

/// اختصارات صغيرة تُستخدم كثيرًا في بناء الواجهات.
extension SpacingX on num {
  /// فراغ رأسي بارتفاع هذا الرقم.
  SizedBox get h => SizedBox(height: toDouble());

  /// فراغ أفقي بعرض هذا الرقم.
  SizedBox get w => SizedBox(width: toDouble());
}

extension ContextX on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;
}

/// تحويل الأرقام إلى الأرقام العربية الهندية المستخدمة في التصميم.
extension ArabicNumeralsX on String {
  static const List<String> _arabic = <String>[
    '٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩',
  ];

  String get toArabicNumerals {
    final StringBuffer buffer = StringBuffer();
    for (final int code in runes) {
      if (code >= 0x30 && code <= 0x39) {
        buffer.write(_arabic[code - 0x30]);
      } else {
        buffer.writeCharCode(code);
      }
    }
    return buffer.toString();
  }
}
