import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../getx_controller/qibla_controller.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_dimensions.dart';
import '../../utils/app_extensions.dart';
import '../../utils/app_routes.dart';
import '../../utils/app_sizer.dart';
import '../../utils/app_text_styles.dart';
import '../../widget/app_header.dart';
import '../../widget/qibla_compass.dart';

/// شاشة القبلة — العنوان y=51، الكعبة y=200 بحجم 50،
/// البوصلة y=353 بقطر 270، الدرجة y=667 والوصف y=726.
class QiblaScreen extends StatelessWidget {
  const QiblaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final QiblaController controller = Get.find<QiblaController>();

    return Column(
      children: <Widget>[
        AppHeader(
          title: 'القبلة',
          onMenuTap: () => Get.toNamed(AppRoutes.menu),
        ),
        SizedBox(height: 119.s),
        Image.asset(
          AppAssets.kaaba,
          width: AppDimensions.kaaba.s,
          height: AppDimensions.kaaba.s,
          fit: BoxFit.contain,
          errorBuilder: (_, _, _) =>
              SizedBox.square(dimension: AppDimensions.kaaba.s),
        ),
        SizedBox(height: 103.s),
        Obx(() => QiblaCompass(angle: controller.needleAngle)),
        SizedBox(height: 44.s),
        Obx(
          () => Text(
            '${controller.qiblaDirection.value.round()}°'.toArabicNumerals,
            style: AppTextStyles.qiblaDegree,
          ),
        ),
        SizedBox(height: 11.s),
        Text('اتجاه القبلة المقدر', style: AppTextStyles.qiblaCaption),
      ],
    );
  }
}
