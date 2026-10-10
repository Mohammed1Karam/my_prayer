import 'package:flutter_test/flutter_test.dart';
import 'package:my_prayer/utils/app_extensions.dart';

void main() {
  test('تحويل الأرقام إلى الأرقام العربية الهندية', () {
    expect('4:32 ص'.toArabicNumerals, '٤:٣٢ ص');
    expect('120°'.toArabicNumerals, '١٢٠°');
  });
}
