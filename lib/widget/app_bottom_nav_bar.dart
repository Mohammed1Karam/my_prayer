import 'package:flutter/material.dart';

import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../utils/app_dimensions.dart';
import '../utils/app_sizer.dart';
import 'app_svg_icon.dart';

/// شريط التنقل السفلي: ارتفاع 80، خلفية بيضاء، وظل ‎#BAB0CE @20%‎ لأعلى.
///
/// الصف يتبع اتجاه الواجهة، فيبدأ الترتيب من اليمين في العربية:
/// الرئيسية ← وردك ← السبحة ← القبلة.
class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  static const List<({String asset, double size})> _items =
      <({String asset, double size})>[
    (asset: AppAssets.navHome, size: AppDimensions.navIcon),
    (asset: AppAssets.navAzkar, size: AppDimensions.navIconAzkar),
    (asset: AppAssets.navSebha, size: AppDimensions.navIcon),
    (asset: AppAssets.navQibla, size: AppDimensions.navIcon),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.navBarHeight.s + MediaQuery.paddingOf(context).bottom,
      decoration: const BoxDecoration(
        color: AppColors.surface,
        boxShadow: AppColors.navBarShadow,
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: List<Widget>.generate(_items.length, (int index) {
            final ({String asset, double size}) item = _items[index];
            final bool isActive = index == currentIndex;
            return Expanded(
              child: GestureDetector(
                onTap: () => onTap(index),
                behavior: HitTestBehavior.opaque,
                child: Center(
                  child: AppSvgIcon(
                    item.asset,
                    size: item.size,
                    color: isActive ? AppColors.lilac : AppColors.navIcon,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
