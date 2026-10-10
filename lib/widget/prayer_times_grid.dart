import 'package:flutter/material.dart';

import '../models/prayer_time.dart';
import '../utils/app_colors.dart';
import '../utils/app_extensions.dart';
import '../utils/app_sizer.dart';
import '../utils/app_text_styles.dart';

/// بطاقة بنفسجية تعرض مواقيت اليوم في عمودين أسفل التقويم.
///
/// الشبكة تتبع اتجاه الواجهة، فالعنصر الأول في أعلى اليمين، وداخل كل خلية
/// اسم الصلاة في جهة البداية والوقت في جهة النهاية كما في صفوف الشاشة الرئيسية.
class PrayerTimesGrid extends StatelessWidget {
  const PrayerTimesGrid({super.key, required this.prayers});

  final List<PrayerTime> prayers;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.s, vertical: 22.s),
      decoration: BoxDecoration(
        color: AppColors.lilac,
        borderRadius: BorderRadius.circular(20.s),
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: prayers.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3.4,
          mainAxisSpacing: 14.s,
          crossAxisSpacing: 24.s,
        ),
        itemBuilder: (BuildContext context, int index) {
          final PrayerTime prayer = prayers[index];
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                prayer.name,
                style: AppTextStyles.dayNumber
                    .copyWith(color: AppColors.textOnPrimary),
              ),
              Text(
                prayer.formattedTime.toArabicNumerals,
                style: AppTextStyles.dayNumber
                    .copyWith(color: AppColors.textOnPrimary),
              ),
            ],
          );
        },
      ),
    );
  }
}
