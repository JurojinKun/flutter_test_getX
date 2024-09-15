import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TranslationsService {
  final _box = GetStorage();
  final _key = "locale";

  Locale get localeLanguageApp => _loadLocaleFromBox();

  void switchLocaleLanguage(Locale locale) {
    Get.updateLocale(locale);
    _saveLocaleToBox(locale);
  }

  String getDeviceLocale() {
    if (Get.deviceLocale != null) {
      return Get.deviceLocale!.languageCode;
    }
    return "en";
  }

  Locale _loadLocaleFromBox() =>
      Locale(_box.read(_key) ?? getDeviceLocale());

  void _saveLocaleToBox(Locale localeLanguage) =>
      _box.write(_key, localeLanguage.languageCode);
}
