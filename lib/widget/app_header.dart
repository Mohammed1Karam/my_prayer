import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../utils/app_dimensions.dart';
import '../utils/app_sizer.dart';
import '../utils/app_text_styles.dart';
import 'app_svg_icon.dart';

/// ترويسة الشاشة: زر القائمة في جهة البداية (اليمين)، والعنوان في المنتصف،
/// وعنصر اختياري في جهة النهاية (اليسار) مثل أيقونة التقويم.
///
/// الصف يتبع اتجاه الواجهة، فأول عنصر فيه يستقرّ على اليمين في العربية.
/// يُحجز للعنصر الجانبي عرض ثابت حتى يبقى العنوان متمركزًا مع وجوده أو غيابه.
class AppHeader extends StatelessWidget {
  const AppHeader({
    super.key,
    this.title,
    this.titleWidget,
    this.titleStyle,
    this.action,
    this.onMenuTap,
    this.top = AppDimensions.headerTop,
  }) : assert(
          title != null || titleWidget != null,
          'الترويسة تحتاج عنوانًا نصيًّا أو عنصر عنوان.',
        );

  /// العنوان النصّي — يُستعمل ما لم يُمرَّر [titleWidget].
  final String? title;

  /// عنوان مركّب (مثل تاريخ متغيّر داخل `Obx`).
  final Widget? titleWidget;

  final TextStyle? titleStyle;

  /// عنصر جهة النهاية (اليسار في العربية).
  final Widget? action;

  final VoidCallback? onMenuTap;

  /// بُعد الترويسة عن أعلى الشاشة بإحداثيات Figma.
  ///
  /// الرقم مقاس من أعلى الإطار في التصميم، وهذا الإطار يشمل شريط الحالة
  /// أصلًا، فلا يُضاف إليه ارتفاع شريط الحالة وإلا حُسب مرتين وظهر فراغ
  /// زائد فوق الترويسة. يُكتفى بألّا ينزل الرقم تحت حدّ المنطقة الآمنة.
  final double top;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        top: math.max(top.s, MediaQuery.paddingOf(context).top),
        start: AppDimensions.screenPadding.s,
        end: AppDimensions.screenPadding.s,
      ),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: onMenuTap,
            behavior: HitTestBehavior.opaque,
            child: const AppSvgIcon(
              AppAssets.menuBurger,
              size: AppDimensions.headerIcon,
              color: AppColors.textHeader,
            ),
          ),
          Expanded(
            child: titleWidget ??
                Text(
                  title!,
                  textAlign: TextAlign.center,
                  style: titleStyle ?? AppTextStyles.screenTitle,
                ),
          ),
          SizedBox(
            width: AppDimensions.headerIcon.s,
            child: action,
          ),
        ],
      ),
    );
  }
}
