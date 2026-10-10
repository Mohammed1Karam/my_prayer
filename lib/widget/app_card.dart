import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_dimensions.dart';
import '../utils/app_sizer.dart';

/// بطاقة بيضاء بنصف قطر وظل من التصميم.
class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.radius = AppDimensions.azkarCardRadius,
    this.color = AppColors.surface,
    this.shadow = AppColors.azkarCardShadow,
    this.onTap,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double radius;
  final Color color;
  final List<BoxShadow> shadow;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: margin,
        padding: padding ?? EdgeInsets.all(20.s),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius.s),
          boxShadow: shadow,
        ),
        child: child,
      ),
    );
  }
}
