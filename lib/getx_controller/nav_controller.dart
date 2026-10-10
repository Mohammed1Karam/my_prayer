import 'package:get/get.dart';

/// التبويب النشط في شريط التنقل السفلي.
class NavController extends GetxController {
  final RxInt currentIndex = 0.obs;

  void changeTab(int index) => currentIndex.value = index;
}
