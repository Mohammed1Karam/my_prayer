import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_dimensions.dart';
import '../utils/app_sizer.dart';

/// مؤشّر الصفحات: النقطة النشطة مستطيل 25×10 بنصف قطر 5،
/// والخاملة دائرة قطرها 10 بلون ‎#D9D9D9‎.
class PageDots extends StatelessWidget {
  const PageDots({
    super.key,
    required this.count,
    required this.activeIndex,
    this.activeColor = AppColors.primary,
    this.activeWidth = AppDimensions.dotActiveWidth,
  });

  final int count;
  final int activeIndex;
  final Color activeColor;
  final double activeWidth;

  @override
  Widget build(BuildContext context) {
    // النقاط تتبع اتجاه الواجهة: الأولى في جهة البداية (اليمين في العربية)
    // تمامًا كما تبدأ صفحات PageView من اليمين.
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(count, (int index) {
        final bool isActive = index == activeIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          margin: EdgeInsetsDirectional.symmetric(
            horizontal: (AppDimensions.dotGap / 2).s,
          ),
          width: (isActive ? activeWidth : AppDimensions.dot).s,
          height: AppDimensions.dot.s,
          decoration: BoxDecoration(
            color: isActive ? activeColor : AppColors.dotInactive,
            borderRadius: BorderRadius.circular(AppDimensions.dotRadius.s),
          ),
        );
      }),
    );
  }
}
