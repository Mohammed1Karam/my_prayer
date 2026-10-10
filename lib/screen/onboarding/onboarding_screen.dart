import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../getx_controller/onboarding_controller.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_sizer.dart';
import '../../utils/app_text_styles.dart';
import '../../widget/onboarding_next_button.dart';
import '../../widget/page_dots.dart';
import 'onboarding_page_view.dart';

/// شاشات التعريف الثلاث.
///
/// النقاط تبقى عند y=844 كما في Figma، وفوقها زر الانتقال، ويعلوهما
/// زر «تخطي». المساحة المحجوزة لهذا كله هي [_bottomReserved] فلا يتداخل
/// معها نص الآية مهما طال.
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  /// المساحة المحجوزة أسفل كتلة النص: حتى النقاط (y=853) في الصفحتين
  /// الأوليين، وحتى أعلى زر «ابدأ الآن» في الصفحة الأخيرة.
  static const double _bottomReserved = 73;
  static const double _bottomReservedLast = 176;

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.put(OnboardingController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: <Widget>[
          PageView.builder(
            controller: controller.pageController,
            onPageChanged: controller.onPageChanged,
            itemCount: controller.pages.length,
            itemBuilder: (BuildContext context, int index) =>
                OnboardingPageView(
              page: controller.pages[index],
              bottomReserved: index == controller.pages.length - 1
                  ? _bottomReservedLast
                  : _bottomReserved,
            ),
          ),

          // «تخطي» أعلى اليسار — يُخفى في الصفحة الأخيرة.
          PositionedDirectional(
            top: 20.s + MediaQuery.paddingOf(context).top,
            end: 24.s,
            child: Obx(
              () => AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: controller.isLastPage ? 0 : 1,
                child: IgnorePointer(
                  ignoring: controller.isLastPage,
                  child: GestureDetector(
                    onTap: controller.finish,
                    behavior: HitTestBehavior.opaque,
                    child: Padding(
                      padding: EdgeInsets.all(8.s),
                      child: Text(
                        'تخطي',
                        style: AppTextStyles.onboardingBody.copyWith(
                          color: AppColors.textMuted,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // النقاط في موضعها من Figma (y=844)، والزر بجانبها فلا يزاحم النص.
          PositionedDirectional(
            start: 0,
            end: 0,
            bottom: 72.s,
            child: Obx(
              () => PageDots(
                count: controller.pages.length,
                activeIndex: controller.currentPage.value,
                activeColor:
                    controller.pages[controller.currentPage.value].dotColor,
              ),
            ),
          ),
          // في الصفحتين الأولى والثانية: زر دائري بجانب النقاط.
          // في الأخيرة: يتمدّد ويتوسّط فوقها حتى لا يغطّيها.
          Obx(
            () => AnimatedPositionedDirectional(
              duration: const Duration(milliseconds: 280),
              curve: Curves.easeOutCubic,
              start: 0,
              end: 0,
              bottom: controller.isLastPage ? 112.s : 49.s,
              child: Align(
                alignment: controller.isLastPage
                    ? Alignment.center
                    : AlignmentDirectional.centerEnd,
                child: Padding(
                  padding: EdgeInsetsDirectional.only(
                    end: controller.isLastPage ? 0 : 29.s,
                  ),
                  child: OnboardingNextButton(
                    isLastPage: controller.isLastPage,
                    color:
                        controller.pages[controller.currentPage.value].dotColor,
                    onPressed: controller.next,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
