import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import '../utils/app_dimensions.dart';
import '../utils/app_icons.dart';
import '../utils/app_sizer.dart';

/// زر الرجوع: سهم يشير إلى جهة البداية (اليمين في الواجهة العربية).
///
/// يُوضع دائمًا في أول عناصر الصف حتى يستقرّ على جهة البداية مهما كان
/// اتجاه الواجهة، ويُترك في الطرف المقابل فراغ بعرضه ليبقى العنوان متمركزًا.
class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
    this.onTap,
    this.size = AppDimensions.headerIcon,
    this.color = AppColors.textBlack,
  });

  final VoidCallback? onTap;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? Get.back,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: size.s,
        height: size.s,
        child: Icon(AppIcons.back, size: size.s, color: color),
      ),
    );
  }
}
