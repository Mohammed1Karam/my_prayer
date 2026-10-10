import 'package:get/get.dart';

import '../api/mock_data.dart';
import '../models/azkar_category.dart';

/// فئات الأذكار والفئة المفتوحة حاليًا.
class AzkarController extends GetxController {
  final RxList<AzkarCategory> categories = <AzkarCategory>[].obs;
  final Rxn<AzkarCategory> selected = Rxn<AzkarCategory>();

  @override
  void onInit() {
    super.onInit();
    categories.assignAll(MockData.azkarCategories);
    selected.value = categories.first;
  }

  void open(AzkarCategory category) => selected.value = category;
}
