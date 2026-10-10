import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../getx_controller/prayer_times_controller.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_dimensions.dart';
import '../../utils/app_extensions.dart';
import '../../utils/app_sizer.dart';
import '../../utils/app_text_styles.dart';
import '../../widget/app_back_button.dart';
import '../../widget/app_card.dart';
import '../../widget/hijri_calendar_grid.dart';
import '../../widget/prayer_times_grid.dart';
import '../../widget/section_title.dart';

/// شاشة التقويم — ورقة بنصف قطر 30، شبكة الشهر ثم مواقيت اليوم المختار.
class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  int _selectedDay = 16;

  @override
  Widget build(BuildContext context) {
    final PrayerTimesController controller = Get.find<PrayerTimesController>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 29.s),
          children: <Widget>[
            SizedBox(height: 20.s),
            Row(
              children: <Widget>[
                const AppBackButton(),
                Expanded(
                  child: Obx(
                    () => Column(
                      children: <Widget>[
                        Text(
                          controller.date.value.formatted.toArabicNumerals,
                          style: AppTextStyles.screenTitleSmall,
                        ),
                        SizedBox(height: 4.s),
                        Text(
                          '٢٠ تشرين الثاني ٢٠٢٢',
                          style: AppTextStyles.weekDay,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: AppDimensions.headerIcon.s),
              ],
            ),
            SizedBox(height: 34.s),
            AppCard(
              padding: EdgeInsets.all(20.s),
              radius: AppDimensions.sheetRadius,
              child: HijriCalendarGrid(
                dayNames: controller.weekDayNames,
                daysInMonth: 31,
                selectedDay: _selectedDay,
                onDaySelected: (int day) => setState(() => _selectedDay = day),
              ),
            ),
            SizedBox(height: 40.s),
            const SectionTitle('الاربعاء  ٢٠ تشرين الثاني ٢٠٢٢'),
            SizedBox(height: 22.s),
            Obx(() => PrayerTimesGrid(prayers: controller.prayerTimes.toList())),
            SizedBox(height: 40.s),
          ],
        ),
      ),
    );
  }
}
