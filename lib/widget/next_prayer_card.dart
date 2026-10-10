import 'package:flutter/material.dart';

import '../models/prayer_time.dart';
import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../utils/app_dimensions.dart';
import '../utils/app_extensions.dart';
import '../utils/app_sizer.dart';
import '../utils/app_text_styles.dart';

/// بطاقة الصلاة القادمة — 369×174، نصف قطر 10.
///
/// الاسم والوقت في جهة البداية (اليمين في العربية)، ورسمة المصحف في جهة
/// النهاية تخرج قليلًا عن الحافة، والتدرّج ‎#DF98FA → #9055FF‎ يسير قطريًّا
/// من زاوية البداية العليا إلى زاوية النهاية السفلى — أي من اليمين إلى
/// اليسار في الواجهة العربية، فينعكس مع الاتجاه بدل أن يخالفه.
class NextPrayerCard extends StatelessWidget {
  const NextPrayerCard({super.key, required this.prayer});

  final PrayerTime prayer;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimensions.prayerCardWidth.s,
      height: AppDimensions.prayerCardHeight.s,
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Container(
            width: AppDimensions.prayerCardWidth.s,
            height: AppDimensions.prayerCardHeight.s,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(AppDimensions.prayerCardRadius.s),
              gradient: const LinearGradient(
                colors: AppColors.prayerCardGradient,
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
              ),
            ),
          ),
          // الرسمة: عرض 211 وارتفاع 135، خارجة 7 عن حافة النهاية، y=38.
          PositionedDirectional(
            end: (-7).s,
            top: 38.s,
            child: Image.asset(
              AppAssets.quranCard,
              width: 211.s,
              height: 135.s,
              fit: BoxFit.contain,
              errorBuilder: (_, _, _) => SizedBox(width: 211.s),
            ),
          ),
          // الاسم والوقت متمركزان على المحور نفسه: 78.5 من حافة البداية.
          PositionedDirectional(
            start: 0,
            top: 49.s,
            child: SizedBox(
              width: 157.s,
              child: Column(
                children: <Widget>[
                  Text(
                    prayer.name,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.nextPrayerName,
                  ),
                  SizedBox(height: 2.s),
                  Text(
                    prayer.formattedTime.toArabicNumerals,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.nextPrayerTime,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
