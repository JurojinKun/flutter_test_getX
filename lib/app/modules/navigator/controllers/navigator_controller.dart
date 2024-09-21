import 'package:flutter/material.dart';
import 'package:flutter_test_getx/app/modules/home/wrappers/home_wrapper.dart';
import 'package:flutter_test_getx/app/modules/searching/wrappers/searching_wrapper.dart';
import 'package:flutter_test_getx/app/modules/settings/wrappers/settings_wrapper.dart';
import 'package:get/get.dart';

class NavigatorController extends GetxController {
  final currentIndex = 0.obs;
  
  final homeNavigatorKey = Get.nestedKey(1);
  final searchingNavigatorKey = Get.nestedKey(2);
  final settingsNavigatorKey = Get.nestedKey(3);

  Rx<Widget?> homeWrapper = Rx<Widget?>(null);
  Rx<Widget?> searchWrapper = Rx<Widget?>(null);
  Rx<Widget?> settingsWrapper = Rx<Widget?>(null);

  @override
  void onInit() {
    _initPageBottomBar(0);
    super.onInit();
  }

  void _initPageBottomBar(int index) {
    if (index == 0 && homeWrapper.value == null) {
      homeWrapper.value = const HomeWrapper();
    } else if (index == 1 && searchWrapper.value == null) {
      searchWrapper.value = const SearchingWrapper();
    } else if (index == 2 && settingsWrapper.value == null) {
      settingsWrapper.value = const SettingsWrapper();
    }
  }

  void changeIndex(int index) async {
    if (currentIndex.value == index) {
      switch (index) {
        case 0:
          if (homeNavigatorKey!.currentState != null &&
              homeNavigatorKey!.currentState!.canPop()) {
            homeNavigatorKey!.currentState!.popUntil((route) => route.isFirst);
          }
          break;
        case 1:
          if (searchingNavigatorKey!.currentState != null &&
              searchingNavigatorKey!.currentState!.canPop()) {
            searchingNavigatorKey!.currentState!
                .popUntil((route) => route.isFirst);
          }
          break;
        case 2:
          if (settingsNavigatorKey!.currentState != null &&
              settingsNavigatorKey!.currentState!.canPop()) {
            settingsNavigatorKey!.currentState!
                .popUntil((route) => route.isFirst);
          }
          break;
      }
    } else {
      currentIndex.value = index;
    }
    _initPageBottomBar(index);
  }
}
