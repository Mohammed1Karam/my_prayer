import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_icons.dart';
import '../utils/app_sizer.dart';
import '../utils/app_text_styles.dart';

/// زر الانتقال في شاشات التعريف.
///
/// دائري بسهم في الصفحتين الأولى والثانية حتى لا يستهلك ارتفاعًا من كتلة
/// النص، ويتمدّد إلى زر نصّي «ابدأ الآن» في الصفحة الأخيرة.
/// لونه هو لون النقطة النشطة للصفحة الحالية.
class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton({
    super.key,
    required this.isLastPage,
    required this.color,
    required this.onPressed,
  });

  final bool isLastPage;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeOutCubic,
        width: (isLastPage ? 180 : 56).s,
        height: 56.s,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(28.s),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: color.withValues(alpha: 0.4),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: isLastPage
            ? Text(
                'ابدأ الآن',
                style: AppTextStyles.onboardingBody.copyWith(
                  color: AppColors.textOnPrimary,
                  fontWeight: FontWeight.w700,
                ),
              )
            : Icon(
                // ينعكس تلقائيًا مع اتجاه الواجهة فيشير إلى اليسار في العربية.
                AppIcons.forward,
                size: 26.s,
                color: AppColors.textOnPrimary,
              ),
      ),
    );
  }
}
