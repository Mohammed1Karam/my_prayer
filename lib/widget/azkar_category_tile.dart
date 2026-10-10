import 'package:flutter/material.dart';

import '../models/azkar_category.dart';
import '../utils/app_colors.dart';
import '../utils/app_dimensions.dart';
import '../utils/app_icons.dart';
import '../utils/app_sizer.dart';
import '../utils/app_text_styles.dart';
import 'app_svg_icon.dart';

/// بطاقة فئة أذكار: 378×78، نصف قطر 25، ظل أسود ‎@10%‎ blur 4 y 4.
///
/// الترتيب من جهة البداية (اليمين): الأيقونة ثم العنوان،
/// وسهم الفتح في جهة النهاية (اليسار) مشيرًا إلى اتجاه القراءة.
class AzkarCategoryTile extends StatelessWidget {
  const AzkarCategoryTile({
    super.key,
    required this.category,
    required this.onTap,
  });

  final AzkarCategory category;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: AppDimensions.azkarCardHeight.s,
        margin: EdgeInsetsDirectional.only(
          bottom: AppDimensions.azkarCardGap.s,
        ),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppDimensions.azkarCardRadius.s),
          boxShadow: AppColors.azkarCardShadow,
        ),
        child: Row(
          children: <Widget>[
            SizedBox(width: 31.s),
            AppSvgIcon(category.iconPath, size: AppDimensions.azkarIcon),
            SizedBox(width: 25.s),
            Text(category.title, style: AppTextStyles.azkarTitle),
            const Spacer(),
            Icon(
              AppIcons.chevronForward,
              size: 26.s,
              color: AppColors.textMuted,
            ),
            SizedBox(width: 26.s),
          ],
        ),
      ),
    );
  }
}
