import 'package:flutter/material.dart';

import '../../models/onboarding_page_model.dart';
import '../../utils/app_sizer.dart';
import '../../utils/app_text_styles.dart';
import '../../widget/fade_slide_in.dart';

/// صفحة تعريف واحدة — الرسمة بإحداثيات Figma الخاصة بكل صفحة،
/// وكتلة النص تبدأ عند `textTop` وتنتهي قبل منطقة الزر والنقاط.
///
/// النص ملفوف بـ [FittedBox] حتى لا يتجاوز مساحته مهما طال أو تغيّر الخط:
/// بخط التصميم (Somar) يظهر بحجمه الكامل، وبأي خط أعرض يتقلّص بدل أن يتداخل.
class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({
    super.key,
    required this.page,
    required this.bottomReserved,
  });

  final OnboardingPageModel page;

  /// الارتفاع المحجوز أسفل الشاشة للزر والنقاط (بوحدات Figma).
  final double bottomReserved;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        PositionedDirectional(
          start: page.imageStart.s,
          top: page.imageTop.s,
          width: page.imageWidth.s,
          height: page.imageHeight.s,
          child: FadeSlideIn(
            child: Image.asset(
              page.imagePath,
              fit: BoxFit.contain,
              errorBuilder: (_, _, _) => const SizedBox.shrink(),
            ),
          ),
        ),
        PositionedDirectional(
          start: 0,
          end: 0,
          top: page.textTop.s,
          bottom: bottomReserved.s,
          child: Center(
            child: SizedBox(
              width: page.textWidth.s,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Flexible(
                    child: FadeSlideIn(
                      delay: const Duration(milliseconds: 120),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: SizedBox(
                          width: page.textWidth.s,
                          child: Text(
                            page.title,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.verse,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.s),
                  Flexible(
                    child: FadeSlideIn(
                      delay: const Duration(milliseconds: 220),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: SizedBox(
                          width: page.textWidth.s,
                          child: Text(
                            page.description,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.onboardingBody,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
