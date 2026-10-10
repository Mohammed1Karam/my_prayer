import 'package:get/get.dart';

import '../api/mock_data.dart';
import '../preferences/app_preferences.dart';

/// عدّاد السبحة والتنقّل بين صيغ الاستغفار.
class SebhaController extends GetxController {
  final RxInt count = 0.obs;
  final RxInt phraseIndex = 0.obs;

  List<String> get phrases => MockData.tasbeehPhrases;

  String get currentPhrase => phrases[phraseIndex.value];

  @override
  void onInit() {
    super.onInit();
    count.value = AppPreferences.instance.tasbeehCount;
  }

  void increment() {
    count.value++;
    AppPreferences.instance.setTasbeehCount(count.value);
  }

  void reset() {
    count.value = 0;
    AppPreferences.instance.setTasbeehCount(0);
  }

  void nextPhrase() {
    phraseIndex.value = (phraseIndex.value + 1) % phrases.length;
  }

  void previousPhrase() {
    phraseIndex.value =
        (phraseIndex.value - 1 + phrases.length) % phrases.length;
  }
}
