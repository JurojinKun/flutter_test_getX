import 'package:flutter/material.dart';
import 'package:flutter_test_getx/app/theme/theme_service.dart';
import 'package:flutter_test_getx/app/translations/translations_service.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  Rx<ThemeMode> currentTheme = ThemeService().theme.obs;
  Rx<Locale> currentLocale = TranslationsService().localeLanguageApp.obs;

  void switchTheme() {
    ThemeService().switchTheme();
    currentTheme.value = currentTheme.value == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
  }

  void switchLocaleLanguage(Locale newLocale) {
    TranslationsService().switchLocaleLanguage(newLocale);
    currentLocale.value  = newLocale;
  }
}
