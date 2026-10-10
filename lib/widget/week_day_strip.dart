import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_dimensions.dart';
import '../utils/app_extensions.dart';
import '../utils/app_sizer.dart';
import '../utils/app_text_styles.dart';

/// أسماء الأيام ثم أرقامها، واليوم المختار داخل دائرة ‎#A96AFE‎ قطرها 32.5.
class WeekDayStrip extends StatelessWidget {
  const WeekDayStrip({
    super.key,
    required this.dayNames,
    required this.dayNumbers,
    required this.selectedIndex,
    required this.onDaySelected,
  });

  final List<String> dayNames;
  final List<int> dayNumbers;
  final int selectedIndex;
  final ValueChanged<int> onDaySelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: dayNames
              .map(
                (String name) => Text(name, style: AppTextStyles.weekDay),
              )
              .toList(),
        ),
        SizedBox(height: 10.s),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List<Widget>.generate(dayNumbers.length, (int index) {
            final bool isSelected = index == selectedIndex;
            return GestureDetector(
              onTap: () => onDaySelected(index),
              behavior: HitTestBehavior.opaque,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                width: AppDimensions.dayCircle.s,
                height: AppDimensions.dayCircle.s,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '${dayNumbers[index]}'.toArabicNumerals,
                  style: AppTextStyles.dayNumber.copyWith(
                    color: isSelected
                        ? AppColors.textOnPrimary
                        : AppColors.textBlack,
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
