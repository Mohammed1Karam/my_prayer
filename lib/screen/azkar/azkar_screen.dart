import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../getx_controller/azkar_controller.dart';
import '../../models/azkar_category.dart';
import '../../utils/app_routes.dart';
import '../../utils/app_sizer.dart';
import '../../widget/app_header.dart';
import '../../widget/azkar_category_tile.dart';
import '../../widget/fade_slide_in.dart';

/// شاشة «وردك» — العنوان y=51 والبطاقات تبدأ عند y=159 بعرض 378.
class AzkarScreen extends StatelessWidget {
  const AzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AzkarController controller = Get.find<AzkarController>();

    return Column(
      children: <Widget>[
        AppHeader(
          title: 'وردك',
          top: 51,
          onMenuTap: () => Get.toNamed(AppRoutes.menu),
        ),
        SizedBox(height: 78.s),
        Expanded(
          child: Obx(
            () => ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 25.s),
              itemCount: controller.categories.length,
              itemBuilder: (BuildContext context, int index) {
                final AzkarCategory category = controller.categories[index];
                return FadeSlideIn(
                  delay: Duration(milliseconds: 70 * index),
                  child: AzkarCategoryTile(
                    category: category,
                    onTap: () {
                      controller.open(category);
                      Get.toNamed(AppRoutes.azkarDetails);
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
