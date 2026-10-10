import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../api/mock_data.dart';
import '../models/onboarding_page_model.dart';
import '../preferences/app_preferences.dart';
import '../utils/app_routes.dart';

/// تنقّل شاشات التعريف الثلاث.
class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;

  List<OnboardingPageModel> get pages => MockData.onboardingPages;

  bool get isLastPage => currentPage.value == pages.length - 1;

  void onPageChanged(int index) => currentPage.value = index;

  Future<void> next() async {
    if (isLastPage) {
      await finish();
      return;
    }
    await pageController.nextPage(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOutCubic,
    );
  }

  Future<void> finish() async {
    await AppPreferences.instance.setOnboardingSeen(true);
    Get.offAllNamed(AppRoutes.home);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
