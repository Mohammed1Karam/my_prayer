import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_sizer.dart';

/// أنماط النصوص — العائلة والأوزان والأحجام وارتفاعات الأسطر من Figma.
///
/// الخط المستخدم في التصميم هو **Somar**. ضع ملفاته في `assets/fonts/`
/// وفعّل القسم المعلَّق في `pubspec.yaml` ليظهر التطبيق مطابقًا تمامًا؛
/// وإلى حين ذلك يستعمل Flutter الخط العربي الافتراضي للنظام.
class AppTextStyles {
  const AppTextStyles._();

  /// خط التصميم في Figma هو Somar؛ غيّر هذه القيمة إلى 'Somar' فور إضافة ملفاته.
  static const String fontFamily = 'Tajawal';

  static TextStyle _somar(
    double size,
    FontWeight weight,
    Color color, {
    double heightRatio = 1.2,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: size.s,
        fontWeight: weight,
        height: heightRatio,
        color: color,
      );

  // ── شاشة البداية ────────────────────────────────────────────────────
  /// «صلاتي» — Inter 50 / lh 60.5 / أبيض.
  static TextStyle get splashTitle => TextStyle(
        fontFamily: 'Inter',
        fontSize: 50.s,
        fontWeight: FontWeight.w400,
        height: 1.21,
        color: AppColors.textOnPrimary,
      );

  // ── شاشات التعريف ───────────────────────────────────────────────────
  /// الآية — Somar 600 / 35 / lh 42.
  static TextStyle get verse =>
      _somar(35, FontWeight.w600, AppColors.textBlack);

  /// الوصف — Somar 400 / 25 / lh 30.
  static TextStyle get onboardingBody =>
      _somar(25, FontWeight.w400, AppColors.textBody);

  // ── الترويسات ───────────────────────────────────────────────────────
  /// عنوان الشاشة — Somar 600 / 25 / lh 30.
  static TextStyle get screenTitle =>
      _somar(25, FontWeight.w600, AppColors.textBlack);

  /// «سبحة استغفار» — Somar 600 / 24 / lh 28.8.
  static TextStyle get screenTitleSmall =>
      _somar(24, FontWeight.w600, AppColors.textBlack);

  /// التاريخ الهجري في الترويسة — Somar 400 / 20 / lh 24.
  static TextStyle get headerDate =>
      _somar(20, FontWeight.w400, AppColors.textHeader);

  // ── الشاشة الرئيسية ─────────────────────────────────────────────────
  /// اسم الصلاة القادمة — Somar 600 / 30 / lh 36 / أبيض.
  static TextStyle get nextPrayerName =>
      _somar(30, FontWeight.w600, AppColors.textOnPrimary);

  /// وقت الصلاة القادمة — Somar 600 / 35 / lh 42 / أبيض.
  static TextStyle get nextPrayerTime =>
      _somar(35, FontWeight.w600, AppColors.textOnPrimary);

  /// «وقت الصلاة» — Somar 600 / 25 / lh 30.
  static TextStyle get sectionTitle =>
      _somar(25, FontWeight.w600, AppColors.textBlack);

  /// أسماء أيام الأسبوع — 15 / lh 18.
  static TextStyle get weekDay =>
      _somar(15, FontWeight.w400, AppColors.textMuted);

  /// أرقام الأيام — 14 / lh 17.
  static TextStyle get dayNumber =>
      _somar(14, FontWeight.w500, AppColors.textBlack, heightRatio: 1.21);

  /// اسم الصلاة في القائمة — Somar 400 / 24 / lh 28.8.
  static TextStyle get prayerName =>
      _somar(24, FontWeight.w400, AppColors.textMuted);

  /// وقت الصلاة في القائمة — Somar 400 / 25 / lh 30.
  static TextStyle get prayerTime =>
      _somar(25, FontWeight.w400, AppColors.textMuted);

  // ── الأذكار ─────────────────────────────────────────────────────────
  /// عنوان فئة الأذكار — Somar 600 / 25 / lh 30.
  static TextStyle get azkarTitle =>
      _somar(25, FontWeight.w600, AppColors.textBlack);

  /// نص الذكر — Somar 400 / 24 / lh 28.8.
  static TextStyle get zikr =>
      _somar(24, FontWeight.w400, AppColors.textBlack);

  // ── السبحة ──────────────────────────────────────────────────────────
  /// صيغة الاستغفار — Somar 600 / 25 / lh 30.
  static TextStyle get tasbeehPhrase =>
      _somar(25, FontWeight.w600, AppColors.textBlack);

  /// العدّاد — Somar 600 / 70 / lh 84 / أبيض.
  static TextStyle get counter =>
      _somar(70, FontWeight.w600, AppColors.textOnPrimary);

  // ── القبلة ──────────────────────────────────────────────────────────
  /// «١٢٠°» — Somar 600 / 50 / lh 60.
  static TextStyle get qiblaDegree =>
      _somar(50, FontWeight.w600, AppColors.textBlack);

  /// «اتجاه القبلة المقدر» — Somar 400 / 27 / lh 32.4.
  static TextStyle get qiblaCaption =>
      _somar(27, FontWeight.w400, AppColors.textQibla);

  // ── القائمة الجانبية ────────────────────────────────────────────────
  static TextStyle get menuItem =>
      _somar(25, FontWeight.w400, AppColors.textBlack);
}
