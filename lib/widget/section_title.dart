import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_dimensions.dart';
import '../utils/app_sizer.dart';
import '../utils/app_text_styles.dart';

/// عنوان قسم محاذٍ لليمين يعلو خطًّا بنفسجيًّا عرضه 326 وسماكته 3.
class SectionTitle extends StatelessWidget {
  const SectionTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: AppTextStyles.sectionTitle),
        SizedBox(height: 15.s),
        Container(
          width: AppDimensions.sectionRuleWidth.s,
          height: AppDimensions.sectionRuleHeight.s,
          color: AppColors.primary,
        ),
      ],
    );
  }
}
