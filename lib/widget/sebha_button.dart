import 'package:flutter/material.dart';

import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../utils/app_dimensions.dart';
import '../utils/app_extensions.dart';
import '../utils/app_sizer.dart';
import '../utils/app_text_styles.dart';

/// زر السبحة: نقش زخرفي 311×323 خلف دائرة ‎#CF8AFB‎ قطرها 229
/// بظل أسود ‎@25%‎ blur 4 y 4، والعدّاد بداخلها بحجم 70.
class SebhaButton extends StatefulWidget {
  const SebhaButton({
    super.key,
    required this.count,
    required this.onTap,
    this.onLongPress,
  });

  final int count;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;

  @override
  State<SebhaButton> createState() => _SebhaButtonState();
}

class _SebhaButtonState extends State<SebhaButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 120),
    lowerBound: 0,
    upperBound: 0.05,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    _controller.forward().then((_) => _controller.reverse());
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimensions.sebhaPatternWidth.s,
      height: AppDimensions.sebhaPatternHeight.s,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Image.asset(
            AppAssets.sebhaPattern,
            width: AppDimensions.sebhaPatternWidth.s,
            height: AppDimensions.sebhaPatternHeight.s,
            fit: BoxFit.contain,
            errorBuilder: (_, _, _) => const SizedBox.shrink(),
          ),
          GestureDetector(
            onTap: _handleTap,
            onLongPress: widget.onLongPress,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget? child) =>
                  Transform.scale(scale: 1 - _controller.value, child: child),
              child: Container(
                width: AppDimensions.sebhaCircle.s,
                height: AppDimensions.sebhaCircle.s,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: AppColors.orchid,
                  shape: BoxShape.circle,
                  boxShadow: AppColors.sebhaShadow,
                ),
                child: Text(
                  '${widget.count}'.toArabicNumerals,
                  style: AppTextStyles.counter,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
