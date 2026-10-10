import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_sizer.dart';
import '../utils/app_text_styles.dart';

/// زر ممتلئ بحواف دائرية بلون الهوية.
class PillButton extends StatelessWidget {
  const PillButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.color = AppColors.primary,
    this.height = 52,
  });

  final String label;
  final VoidCallback onPressed;
  final Color color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.s,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: AppColors.textOnPrimary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular((height / 2).s),
          ),
        ),
        child: Text(
          label,
          style: AppTextStyles.azkarTitle.copyWith(
            color: AppColors.textOnPrimary,
          ),
        ),
      ),
    );
  }
}
