import 'package:flutter/material.dart';

import '../models/prayer_time.dart';
import '../utils/app_colors.dart';
import '../utils/app_dimensions.dart';
import '../utils/app_extensions.dart';
import '../utils/app_sizer.dart';
import '../utils/app_text_styles.dart';
import 'app_svg_icon.dart';

/// صف صلاة واحد: ارتفاع 62، الأيقونة ثم الاسم في جهة البداية (اليمين)
/// والوقت في جهة النهاية (اليسار)، ويفصله عن التالي خط ‎#BBC4CE @35%‎.
///
/// ترتيب العناصر هنا منطقي لا بصري: أول عنصر في الصف هو أوّل ما تقرؤه
/// العين، أي أقصى اليمين في الواجهة العربية.
class PrayerTimeRow extends StatelessWidget {
  const PrayerTimeRow({
    super.key,
    required this.prayer,
    this.isCurrent = false,
    this.showDivider = true,
  });

  final PrayerTime prayer;
  final bool isCurrent;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    final Color color = isCurrent ? AppColors.primary : AppColors.textMuted;

    return Container(
      height: AppDimensions.prayerRowHeight.s,
      decoration: showDivider
          ? const BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.divider)),
            )
          : null,
      child: Row(
        children: <Widget>[
          SizedBox(width: 8.s),
          // أيقونات الصلوات خطّية رمادية، وتتحوّل للبنفسجي عند الصلاة الحالية.
          AppSvgIcon(
            prayer.iconPath,
            size: AppDimensions.prayerIcon,
            color: color,
          ),
          SizedBox(width: 14.s),
          Text(
            prayer.name,
            style: AppTextStyles.prayerName.copyWith(color: color),
          ),
          const Spacer(),
          Text(
            prayer.formattedTime.toArabicNumerals,
            style: AppTextStyles.prayerTime.copyWith(color: color),
          ),
          SizedBox(width: 15.s),
        ],
      ),
    );
  }
}
