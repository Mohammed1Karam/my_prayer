import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../getx_controller/sebha_controller.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_icons.dart';
import '../../utils/app_routes.dart';
import '../../utils/app_sizer.dart';
import '../../utils/app_text_styles.dart';
import '../../widget/app_header.dart';
import '../../widget/circle_icon_button.dart';
import '../../widget/page_dots.dart';
import '../../widget/sebha_button.dart';

/// شاشة السبحة — العنوان y=49، الصيغة y=170 بعرض 205،
/// النقاط y=254، ودائرة العدّ y=391 بقطر 229.
class SebhaScreen extends StatelessWidget {
  const SebhaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SebhaController controller = Get.find<SebhaController>();

    return Column(
      children: <Widget>[
        AppHeader(
          title: 'سبحة استغفار',
          titleStyle: AppTextStyles.screenTitleSmall,
          onMenuTap: () => Get.toNamed(AppRoutes.menu),
        ),
        SizedBox(height: 92.s),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 29.s),
          child: Obx(
            () => Row(
              children: <Widget>[
                // السهم الأول يستقرّ على جهة البداية (اليمين) ويشير إليها.
                CircleIconButton(
                  icon: AppIcons.chevronBack,
                  onTap: controller.previousPhrase,
                ),
                Expanded(
                  child: SizedBox(
                    width: 205.s,
                    child: Text(
                      controller.currentPhrase,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.tasbeehPhrase,
                    ),
                  ),
                ),
                CircleIconButton(
                  icon: AppIcons.chevronForward,
                  onTap: controller.nextPhrase,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 24.s),
        Obx(
          () => PageDots(
            count: controller.phrases.length,
            activeIndex: controller.phraseIndex.value,
            activeColor: AppColors.orchid,
            activeWidth: 18,
          ),
        ),
        SizedBox(height: 83.s),
        Obx(
          () => SebhaButton(
            count: controller.count.value,
            onTap: controller.increment,
            onLongPress: controller.reset,
          ),
        ),
      ],
    );
  }
}

