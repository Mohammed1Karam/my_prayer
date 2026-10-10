import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_sizer.dart';

/// أيقونة من `assets/icons` — تتعامل مع SVG و PNG معًا،
/// لأن بعض أيقونات التصميم مصدَّرة نقطية من Figma.
class AppSvgIcon extends StatelessWidget {
  const AppSvgIcon(
    this.assetPath, {
    super.key,
    required this.size,
    this.color,
  });

  final String assetPath;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final double side = size.s;
    if (assetPath.endsWith('.svg')) {
      return SvgPicture.asset(
        assetPath,
        width: side,
        height: side,
        colorFilter:
            color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
      );
    }
    return Image.asset(
      assetPath,
      width: side,
      height: side,
      color: color,
      errorBuilder: (_, _, _) => SizedBox.square(dimension: side),
    );
  }
}
