import 'package:flutter/material.dart';
import 'package:flutter_test_getx/app/theme/theme_service.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  // initializing with the current theme of the device
  Rx<ThemeMode> currentTheme = ThemeService().theme.obs;

  // function to switch between themes
  void switchTheme() {
    ThemeService().switchTheme();
    currentTheme.value = currentTheme.value == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
  }
}
