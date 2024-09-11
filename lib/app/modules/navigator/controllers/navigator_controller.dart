import 'package:flutter_test_getx/app/routes/app_pages.dart';
import 'package:get/get.dart';

class NavigatorController extends GetxController {
  final currentIndex = 0.obs;
  final homeNavigatorKey = Get.nestedKey(1);
  final searchingNavigatorKey = Get.nestedKey(2);
  final settingsNavigatorKey = Get.nestedKey(3);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeIndex(int index) {
    if (currentIndex.value == index) {
      switch (index) {
      case 0:
        if (homeNavigatorKey!.currentState != null && homeNavigatorKey!.currentState!.canPop()) {
          Get.offAllNamed(Routes.home, id: 1);
        }
        break;
      case 1:
        if (searchingNavigatorKey!.currentState != null && searchingNavigatorKey!.currentState!.canPop()) {
          Get.offAllNamed(Routes.searching, id: 2);
        }
        break;
      case 2:
        if (settingsNavigatorKey!.currentState != null && settingsNavigatorKey!.currentState!.canPop()) {
          Get.offAllNamed(Routes.settings, id: 3);
        }
        break;
    }
    } else {
      currentIndex.value = index;
    }
  }
}
