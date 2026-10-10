import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../preferences/app_preferences.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_routes.dart';
import '../../utils/app_sizer.dart';
import '../../utils/app_text_styles.dart';

/// شاشة البداية — خلفية ‎#DF98FA‎، صورة المسجد 766×425 عند y=501،
/// وكلمة «صلاتي» بحجم 50 عند y=411.
///
/// رسمة المسجد زخرفية، والقاعدة المتّبعة في التطبيق أن تُعكس التخطيطات مع
/// اتجاه الواجهة ولا تُعكس الرسوم؛ لذلك تبقى بإحداثيّها الفيزيائي كما في
/// Figma، بينما يتمركز النص باستخدام مواضع اتجاهية.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    await Future<void>.delayed(const Duration(milliseconds: 2200));
    if (!mounted) return;
    Get.offAllNamed(
      AppPreferences.instance.onboardingSeen
          ? AppRoutes.home
          : AppRoutes.onboarding,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lilac,
      body: Stack(
        children: <Widget>[
          Positioned(
            left: (-281).s,
            top: 501.s,
            child: Image.asset(
              AppAssets.splashMosque,
              width: 766.s,
              height: 425.s,
              fit: BoxFit.contain,
              errorBuilder: (_, _, _) => const SizedBox.shrink(),
            ),
          ),
          PositionedDirectional(
            start: 0,
            end: 0,
            top: 411.s,
            child: Text(
              'صلاتي',
              textAlign: TextAlign.center,
              style: AppTextStyles.splashTitle,
            ),
          ),
        ],
      ),
    );
  }
}
