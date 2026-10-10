import 'package:get/get.dart';

/// اتجاه القبلة المقدّر وزاوية البوصلة.
///
/// القيم ثابتة مؤقتًا. لربطها بالجهاز: اقرأ الموقع عبر `geolocator`
/// واتجاه البوصلة عبر `flutter_compass`، ثم احسب الزاوية نحو الكعبة.
class QiblaController extends GetxController {
  /// اتجاه القبلة بالدرجات من الشمال.
  final RxDouble qiblaDirection = 120.0.obs;

  /// اتجاه الجهاز الحالي بالدرجات.
  final RxDouble deviceHeading = 0.0.obs;

  /// الزاوية التي يجب أن يدور بها مؤشر البوصلة.
  double get needleAngle => qiblaDirection.value - deviceHeading.value;
}
