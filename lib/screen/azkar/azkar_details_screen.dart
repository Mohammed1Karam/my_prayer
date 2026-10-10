import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../getx_controller/azkar_controller.dart';
import '../../models/azkar_category.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_sizer.dart';
import '../../utils/app_text_styles.dart';
import '../../widget/app_back_button.dart';
import '../../widget/fade_slide_in.dart';
import '../../widget/zikr_card.dart';

/// تفاصيل فئة الأذكار — ورقة بيضاء بنصف قطر 30، العنوان في الأعلى
/// وسهم الرجوع في جهة البداية (اليمين)، ثم بطاقات الأذكار بعرض 350.
class AzkarDetailsScreen extends StatelessWidget {
  const AzkarDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AzkarController controller = Get.find<AzkarController>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Obx(() {
          final AzkarCategory? category = controller.selected.value;
          if (category == null) return const SizedBox.shrink();

          return Column(
            children: <Widget>[
              SizedBox(height: 24.s),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 39.s),
                child: Row(
                  children: <Widget>[
                    const AppBackButton(size: 28),
                    Expanded(
                      child: Text(
                        category.title,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.screenTitle,
                      ),
                    ),
                    SizedBox(width: 28.s),
                  ],
                ),
              ),
              SizedBox(height: 40.s),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 39.s),
                  itemCount: category.azkar.length,
                  itemBuilder: (BuildContext context, int index) => FadeSlideIn(
                    delay: Duration(milliseconds: 70 * index),
                    child: ZikrCard(zikr: category.azkar[index]),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
