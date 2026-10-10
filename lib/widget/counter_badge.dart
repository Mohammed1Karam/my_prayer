import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_extensions.dart';
import '../utils/app_sizer.dart';
import '../utils/app_text_styles.dart';

/// شارة عدد تكرار الذكر — دائرة قطرها 28 بلون ‎#A96AFE‎.
class CounterBadge extends StatelessWidget {
  const CounterBadge({
    super.key,
    required this.value,
    this.filled = true,
    this.size = 28,
  });

  final int value;
  final bool filled;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.s,
      height: size.s,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: filled ? AppColors.primary : AppColors.zikrCard,
        shape: BoxShape.circle,
      ),
      child: Text(
        '$value'.toArabicNumerals,
        style: AppTextStyles.dayNumber.copyWith(
          color: filled ? AppColors.textOnPrimary : AppColors.primary,
        ),
      ),
    );
  }
}
