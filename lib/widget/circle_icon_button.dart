import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_sizer.dart';

/// زر دائري صغير يُستخدم لأسهم التنقّل.
class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.size = 24,
    this.color = AppColors.textBlack,
  });

  final IconData icon;
  final VoidCallback onTap;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Icon(icon, size: size.s, color: color),
    );
  }
}
