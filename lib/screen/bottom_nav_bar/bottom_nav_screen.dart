import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../getx_controller/nav_controller.dart';
import '../../utils/app_colors.dart';
import '../../widget/app_bottom_nav_bar.dart';
import '../azkar/azkar_screen.dart';
import '../home/home_screen.dart';
import '../qibla/qibla_screen.dart';
import '../sebha/sebha_screen.dart';

/// الحاوية الرئيسية: أربع شاشات يتنقّل بينها الشريط السفلي.
class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});

  static const List<Widget> _screens = <Widget>[
    HomeScreen(),
    AzkarScreen(),
    SebhaScreen(),
    QiblaScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final NavController controller = Get.find<NavController>();

    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.background,
        extendBody: true,
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: _screens,
        ),
        bottomNavigationBar: AppBottomNavBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeTab,
        ),
      ),
    );
  }
}
