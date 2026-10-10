import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/mock_data.dart';
import '../../getx_controller/settings_controller.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_dimensions.dart';
import '../../utils/app_sizer.dart';
import '../../widget/fade_slide_in.dart';
import '../../widget/menu_item_tile.dart';

/// القائمة الجانبية — لوح أبيض بعرض 332 ملتصق بجهة البداية (اليمين في
/// العربية) فوق طبقة ‎#858383 @30%‎ تكشف الشاشة السابقة خلفها.
///
/// اللوح أول عناصر الصف فيستقرّ على جهة البداية مهما كان اتجاه الواجهة،
/// وتنحني حافته الداخلية (جهة النهاية) بنصف قطر 30.
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsController controller = Get.find<SettingsController>();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Row(
        children: <Widget>[
          Container(
            width: 332.s,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadiusDirectional.horizontal(
                end: Radius.circular(AppDimensions.sheetRadius.s),
              ),
            ),
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 68.s),
                  // الصورة: 53 من حافة اللوح الخارجية و29 من الداخلية.
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: 29.s, end: 53.s),
                    child: ClipOval(
                      child: Image.asset(
                        AppAssets.menuAvatar,
                        width: 250.s,
                        height: 250.s,
                        fit: BoxFit.cover,
                        errorBuilder: (_, _, _) => Container(
                          width: 250.s,
                          height: 250.s,
                          color: AppColors.violet,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 62.s),
                  // الخيارات: الأيقونات على بُعد 45 من حافة اللوح الخارجية.
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: 45.s, end: 20.s),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Obx(
                          () => MenuItemTile(
                            title: controller.city.value,
                            iconPath: AppAssets.menuLocation,
                            iconSize: 27,
                            onTap: () {},
                          ),
                        ),
                        ...List<Widget>.generate(
                          MockData.menuItems.length - 1,
                          (int index) {
                            final ({String title, String iconPath}) item =
                                MockData.menuItems[index + 1];
                            return FadeSlideIn(
                              delay: Duration(milliseconds: 60 * (index + 1)),
                              child: MenuItemTile(
                                title: item.title,
                                iconPath: item.iconPath,
                                iconSize: index == 0 ? 32 : 25,
                                onTap: () {},
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: Get.back,
              behavior: HitTestBehavior.opaque,
              child: Container(color: AppColors.scrim),
            ),
          ),
        ],
      ),
    );
  }
}
