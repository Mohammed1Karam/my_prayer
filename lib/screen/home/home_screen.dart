import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../getx_controller/prayer_times_controller.dart';
import '../../models/prayer_time.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_extensions.dart';
import '../../utils/app_routes.dart';
import '../../utils/app_sizer.dart';
import '../../utils/app_text_styles.dart';
import '../../widget/app_header.dart';
import '../../widget/app_svg_icon.dart';
import '../../widget/fade_slide_in.dart';
import '../../widget/next_prayer_card.dart';
import '../../widget/prayer_time_row.dart';
import '../../widget/section_title.dart';
import '../../widget/week_day_strip.dart';

/// الشاشة الرئيسية — الترويسة y=60، البطاقة y=118، شريط الأيام y=313،
/// «وقت الصلاة» y=405، والصلوات تبدأ عند y=465.
///
/// الترويسة هي [AppHeader] نفسها المستعملة في بقية التبويبات: زر القائمة في
/// جهة البداية (اليمين)، التاريخ في المنتصف، وأيقونة التقويم في جهة النهاية.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PrayerTimesController controller = Get.find<PrayerTimesController>();

    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        AppHeader(
          top: 60,
          onMenuTap: () => Get.toNamed(AppRoutes.menu),
          titleWidget: Obx(
            () => Text(
              controller.date.value.formatted.toArabicNumerals,
              textAlign: TextAlign.center,
              style: AppTextStyles.headerDate,
            ),
          ),
          action: GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.calendar),
            behavior: HitTestBehavior.opaque,
            child: const AppSvgIcon(
              AppAssets.calendar,
              size: 26,
              color: AppColors.textHeader,
            ),
          ),
        ),
        SizedBox(height: 34.s),
        Center(
          child: Obx(
            () => FadeSlideIn(
              child: NextPrayerCard(prayer: controller.nextPrayer),
            ),
          ),
        ),
        SizedBox(height: 21.s),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 39.s),
          child: Obx(
            () => WeekDayStrip(
              dayNames: controller.weekDayNames,
              dayNumbers: controller.weekDayNumbers,
              selectedIndex: controller.selectedDayIndex.value,
              onDaySelected: controller.selectDay,
            ),
          ),
        ),
        SizedBox(height: 17.s),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.s),
          child: const SectionTitle('وقت الصلاة'),
        ),
        SizedBox(height: 15.s),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 43.s),
          child: Obx(
            () => Column(
              children: List<Widget>.generate(
                controller.prayerTimes.length,
                (int index) {
                  final PrayerTime prayer = controller.prayerTimes[index];
                  return FadeSlideIn(
                    delay: Duration(milliseconds: 60 * index),
                    child: PrayerTimeRow(
                      prayer: prayer,
                      isCurrent: controller.isCurrent(prayer),
                      showDivider: index != controller.prayerTimes.length - 1,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        SizedBox(height: 40.s),
      ],
    );
  }
}
