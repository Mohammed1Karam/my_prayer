import 'package:flutter/material.dart';

import '../models/zikr.dart';
import '../utils/app_colors.dart';
import '../utils/app_dimensions.dart';
import '../utils/app_sizer.dart';
import '../utils/app_text_styles.dart';
import 'counter_badge.dart';

/// بطاقة ذكر: خلفية ‎#863ED5 @5%‎، نصف قطر 10،
/// ظل أسود ‎@5%‎ blur 50 y 20، وشارة العدد تحت النص.
class ZikrCard extends StatelessWidget {
  const ZikrCard({super.key, required this.zikr, this.filledBadge = true});

  final Zikr zikr;
  final bool filledBadge;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.s,
      margin: EdgeInsets.only(bottom: 18.s),
      padding: EdgeInsets.symmetric(horizontal: 20.s, vertical: 22.s),
      decoration: BoxDecoration(
        color: AppColors.zikrCard,
        borderRadius: BorderRadius.circular(AppDimensions.zikrCardRadius.s),
        boxShadow: AppColors.zikrCardShadow,
      ),
      child: Column(
        children: <Widget>[
          Text(
            zikr.text,
            textAlign: TextAlign.center,
            style: AppTextStyles.zikr,
          ),
          SizedBox(height: 16.s),
          CounterBadge(value: zikr.repeat, filled: filledBadge),
        ],
      ),
    );
  }
}
