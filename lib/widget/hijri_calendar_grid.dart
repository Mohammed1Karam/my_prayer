import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_extensions.dart';
import '../utils/app_sizer.dart';
import '../utils/app_text_styles.dart';

/// شبكة أيام الشهر — أسماء الأيام في الأعلى واليوم المختار داخل دائرة بنفسجية.
class HijriCalendarGrid extends StatelessWidget {
  const HijriCalendarGrid({
    super.key,
    required this.dayNames,
    required this.daysInMonth,
    required this.selectedDay,
    required this.onDaySelected,
  });

  final List<String> dayNames;
  final int daysInMonth;
  final int selectedDay;
  final ValueChanged<int> onDaySelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: dayNames
              .map(
                (String name) => Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(name, style: AppTextStyles.weekDay),
                  ),
                ),
              )
              .toList(),
        ),
        SizedBox(height: 12.s),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: daysInMonth,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            childAspectRatio: 1.15,
          ),
          itemBuilder: (BuildContext context, int index) {
            final int day = index + 1;
            final bool isSelected = day == selectedDay;
            return GestureDetector(
              onTap: () => onDaySelected(day),
              behavior: HitTestBehavior.opaque,
              child: Container(
                margin: EdgeInsets.all(4.s),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '$day'.toArabicNumerals,
                  style: AppTextStyles.dayNumber.copyWith(
                    color: isSelected
                        ? AppColors.textOnPrimary
                        : AppColors.textBlack,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
