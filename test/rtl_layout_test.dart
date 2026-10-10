import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_prayer/api/mock_data.dart';
import 'package:my_prayer/models/prayer_time.dart';
import 'package:my_prayer/utils/app_icons.dart';
import 'package:my_prayer/utils/app_sizer.dart';
import 'package:my_prayer/widget/azkar_category_tile.dart';
import 'package:my_prayer/widget/app_bottom_nav_bar.dart';
import 'package:my_prayer/widget/app_header.dart';
import 'package:my_prayer/widget/app_svg_icon.dart';
import 'package:my_prayer/widget/page_dots.dart';
import 'package:my_prayer/widget/prayer_time_row.dart';

/// اختبارات اتجاه: تتحقّق أن العناصر تستقرّ فعلًا في جهاتها الصحيحة
/// داخل واجهة عربية، لا أن الشيفرة «تبدو» صحيحة فحسب.
///
/// القاعدة في كل ما يلي: كلما صغرت `dx` اتجهنا يسارًا، فالعنصر الذي يجب أن
/// يكون في جهة البداية (اليمين) تكون `dx` الخاصة به هي الأكبر.
void main() {
  Future<void> pumpRtl(WidgetTester tester, Widget child) async {
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.rtl,
        child: MediaQuery(
          data: const MediaQueryData(size: Size(428, 926)),
          child: Builder(
            builder: (BuildContext context) {
              AppSizer.init(context);
              return MaterialApp(
                locale: const Locale('ar'),
                home: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Scaffold(body: child),
                ),
              );
            },
          ),
        ),
      ),
    );
    await tester.pump(const Duration(milliseconds: 600));
  }

  testWidgets('زر القائمة في الترويسة يمين العنصر الجانبي', (
    WidgetTester tester,
  ) async {
    await pumpRtl(
      tester,
      const AppHeader(
        title: 'وردك',
        action: Icon(Icons.calendar_today, key: ValueKey<String>('action')),
      ),
    );

    final double menu = tester.getCenter(find.byType(AppSvgIcon)).dx;
    final double action =
        tester.getCenter(find.byKey(const ValueKey<String>('action'))).dx;
    expect(menu, greaterThan(action));
  });

  testWidgets('شريط التنقل يبدأ بالرئيسية من اليمين', (
    WidgetTester tester,
  ) async {
    await pumpRtl(
      tester,
      Align(
        alignment: Alignment.bottomCenter,
        child: AppBottomNavBar(currentIndex: 0, onTap: (_) {}),
      ),
    );

    final Finder icons = find.byType(AppSvgIcon);
    expect(icons, findsNWidgets(4));
    final List<double> xs = <double>[
      for (int i = 0; i < 4; i++) tester.getCenter(icons.at(i)).dx,
    ];
    // الرئيسية (الفهرس 0) في أقصى اليمين والقبلة (3) في أقصى اليسار.
    for (int i = 1; i < xs.length; i++) {
      expect(xs[i], lessThan(xs[i - 1]));
    }
  });

  testWidgets('النقطة النشطة الأولى في أقصى اليمين', (
    WidgetTester tester,
  ) async {
    await pumpRtl(
      tester,
      const PageDots(count: 3, activeIndex: 0),
    );

    final Finder dots = find.byType(AnimatedContainer);
    final double first = tester.getCenter(dots.at(0)).dx;
    final double last = tester.getCenter(dots.at(2)).dx;
    expect(first, greaterThan(last));
  });

  testWidgets('صف الصلاة: الأيقونة ثم الاسم يمينًا والوقت يسارًا', (
    WidgetTester tester,
  ) async {
    final PrayerTime prayer = MockData.prayerTimes.first;
    await pumpRtl(tester, PrayerTimeRow(prayer: prayer));

    final double icon = tester.getCenter(find.byType(AppSvgIcon)).dx;
    final double name = tester.getCenter(find.text(prayer.name)).dx;
    final double time =
        tester.getCenter(find.textContaining(':', findRichText: false)).dx;

    expect(icon, greaterThan(name));
    expect(name, greaterThan(time));
  });

  testWidgets('بطاقة فئة الأذكار: الأيقونة يمينًا وسهم الفتح يسارًا', (
    WidgetTester tester,
  ) async {
    await pumpRtl(
      tester,
      AzkarCategoryTile(category: MockData.azkarCategories.first, onTap: () {}),
    );

    final double icon = tester.getCenter(find.byType(AppSvgIcon)).dx;
    final double title = tester
        .getCenter(find.text(MockData.azkarCategories.first.title))
        .dx;
    final double chevron =
        tester.getCenter(find.byIcon(AppIcons.chevronForward)).dx;

    expect(icon, greaterThan(title));
    expect(title, greaterThan(chevron));
  });
}
