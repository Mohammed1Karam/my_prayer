import 'package:flutter/material.dart';

import '../utils/app_sizer.dart';
import '../utils/app_text_styles.dart';
import 'app_svg_icon.dart';

/// سطر في القائمة الجانبية: الأيقونة في جهة البداية (اليمين) ثم العنوان.
class MenuItemTile extends StatelessWidget {
  const MenuItemTile({
    super.key,
    required this.title,
    required this.iconPath,
    required this.onTap,
    this.iconSize = 27,
  });

  final String title;
  final String iconPath;
  final VoidCallback onTap;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(vertical: 14.s),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            AppSvgIcon(iconPath, size: iconSize),
            SizedBox(width: 20.s),
            Text(title, style: AppTextStyles.menuItem),
          ],
        ),
      ),
    );
  }
}
